import 'dart:io';
import 'dart:typed_data';

import 'package:bdk_dart/bdk.dart' as bdk;
import 'package:flutter_test/flutter_test.dart';
import 'package:sats/api/libbitcoin.dart';

/// Offline tests for the BDK-backed wallet engine. Nothing here touches the
/// network: funding transactions are injected straight into the wallet.
void main() {
  const bip39TestVector =
      'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about';
  const importedWords =
      'burger arrest eight spin embrace outer green fine couch entry drastic kiwi';
  const network = 'test';

  late LibBitcoin lib;
  late Directory tmp;

  setUp(() {
    lib = LibBitcoin();
    tmp = Directory.systemTemp.createTempSync('stackmate_bdk_');
  });

  tearDown(() => tmp.deleteSync(recursive: true));

  ({String pub, String prv}) descriptors(
    String words,
    String purpose,
    String script, {
    String net = network,
  }) {
    final root =
        lib.importMaster(mnemonic: words, passphrase: '', network: net);
    expect(root.hasError, false, reason: root.error);
    final child = lib.deriveHardened(
      masterXPriv: root.result!.xprv,
      account: '0',
      purpose: purpose,
    );
    expect(child.hasError, false, reason: child.error);
    final pub = lib.compile(
      policy: 'pk(${child.result!.fullXPub}/*)',
      scriptType: script,
    );
    final prv = lib.compile(
      policy: 'pk(${child.result!.fullXPrv}/*)',
      scriptType: script,
    );
    expect(pub.hasError, false, reason: pub.error);
    expect(prv.hasError, false, reason: prv.error);
    return (pub: pub.result!, prv: prv.result!);
  }

  test('generateMaster returns a mnemonic of the requested length', () {
    final seed =
        lib.generateMaster(length: '24', passphrase: '', network: network);
    expect(seed.hasError, false, reason: seed.error);
    expect(seed.result!.neuList.length, 24);
    expect(seed.result!.xprv, startsWith('tprv'));
    expect(seed.result!.fingerprint.length, 8);
  });

  test('importMaster rejects an invalid mnemonic', () {
    final seed = lib.importMaster(
      mnemonic: 'not a real mnemonic',
      passphrase: '',
      network: network,
    );
    expect(seed.hasError, true);
  });

  test('derives account keys with origin info', () {
    final root = lib.importMaster(
      mnemonic: bip39TestVector,
      passphrase: '',
      network: 'main',
    );
    expect(root.result!.fingerprint, '73c5da0a');
    final child = lib.deriveHardened(
      masterXPriv: root.result!.xprv,
      account: '0',
      purpose: '84',
    );
    expect(child.result!.hardenedPath, "m/84'/0'/0'");
    // BIP84 test vector account xpub
    expect(
      child.result!.xpub,
      'xpub6CatWdiZiodmUeTDp8LT5or8nmbKNcuyvz7WyksVFkKB4RHwCD3XyuvPEbvqAQY3rAPshWcMLoP2fMFMKHPJ4ZeZXYVUhLv1VMrjPC7PW6V',
    );
    expect(
      child.result!.fullXPub,
      startsWith("[73c5da0a/84'/0'/0']xpub6CatWdiZ"),
    );

    final testnet =
        lib.importMaster(mnemonic: importedWords, passphrase: '', network: network);
    final testChild = lib.deriveHardened(
      masterXPriv: testnet.result!.xprv,
      account: '0',
      purpose: '84',
    );
    expect(testChild.result!.hardenedPath, "m/84'/1'/0'");
    expect(testChild.result!.xpub, startsWith('tpub'));
  });

  test('BIP84 and BIP86 mainnet test vectors', () {
    String firstAddress(String purpose, String script) {
      final root = lib.importMaster(
        mnemonic: bip39TestVector,
        passphrase: '',
        network: 'main',
      );
      final child = lib.deriveHardened(
        masterXPriv: root.result!.xprv,
        account: '0',
        purpose: purpose,
      );
      final desc = lib.compile(
        policy: 'pk(${child.result!.fullXPub}/0/*)',
        scriptType: script,
      );
      return lib.getAddress(descriptor: desc.result!, index: '0').result!;
    }

    expect(
      firstAddress('84', 'wpkh'),
      'bc1qcr8te4kr609gcawutmrza0j4xv80jy8z306fyu',
    );
    expect(
      firstAddress('86', 'tr'),
      'bc1p5cyxnuxmeuwuvkwfem96lqzszd02n6xdcjrs20cac6yqjjwudpxqkedrcr',
    );
  });

  test('keeps the stackmate account/index address scheme', () {
    // Wallets created by stackmate-core use `pk(account_xpub/*)`, i.e.
    // addresses at m/84'/0'/0'/i. They must keep resolving identically.
    final d = descriptors(bip39TestVector, '84', 'wpkh', net: 'main');
    final addr = lib.getAddress(descriptor: d.pub, index: '0').result!;
    final standardReceive = lib.compile(
      policy: 'pk(${d.pub.substring(5, d.pub.indexOf('/*'))}/0/*)',
      scriptType: 'wpkh',
    );
    expect(addr, startsWith('bc1q'));
    expect(
      addr,
      isNot(lib.getAddress(descriptor: standardReceive.result!, index: '0').result),
    );
    expect(
      lib.getAddress(descriptor: d.prv, index: '7').result,
      lib.getAddress(descriptor: d.pub, index: '7').result,
    );
  });

  test('fee conversions round-trip', () {
    final abs = lib.feeRateToAbsolute(feeRate: '2.5', weight: '561');
    expect(abs.result!.absolute, 351);
    final rate = lib.feeAbsoluteToRate(feeAbsolute: '351', weight: '561');
    expect(rate.result!.rate, closeTo(2.5, 0.01));
  });

  test('build, weigh, decode, sign and bump fee offline', () {
    final d = descriptors(importedWords, '84', 'wpkh');
    final dbPath = '${tmp.path}/wallet.db';
    const recipient = 'tb1qw2c3lxufxqe2x9s4rdzh65tpf4d7fssjgh8nv6';

    final receive = lib.lastUnusedAddress(descriptor: d.pub, dbPath: dbPath);
    expect(receive.hasError, false, reason: receive.error);
    expect(receive.result!.index, '0');

    _fund(dbPath, d.pub, receive.result!.address, 100000);
    expect(
      lib.sqliteBalance(descriptor: d.pub, dbPath: dbPath).result,
      100000,
    );

    final dummy = lib.sqliteBuildTransaction(
      descriptor: d.pub,
      dbPath: dbPath,
      txOutputs: '$recipient:20000',
      feeAbsolute: '500',
      policyPath: '',
      sweep: 'false',
    );
    expect(dummy.hasError, false, reason: dummy.error);

    final weight = lib.getWeight(descriptor: d.pub, psbt: dummy.result!.psbt);
    expect(weight.hasError, false, reason: weight.error);
    // 1-in 2-out P2WPKH is ~141 vB.
    expect(weight.result! / 4, inInclusiveRange(135, 150));

    final fee = lib.feeRateToAbsolute(
      feeRate: '2',
      weight: weight.result!.toString(),
    );
    final psbt = lib.sqliteBuildTransaction(
      descriptor: d.pub,
      dbPath: dbPath,
      txOutputs: '$recipient:20000',
      feeAbsolute: fee.result!.absolute.toString(),
      policyPath: '',
      sweep: 'false',
    );

    final decoded = lib.decodePsbt(network: network, psbt: psbt.result!.psbt);
    expect(decoded.hasError, false, reason: decoded.error);
    expect(
      decoded.result!.firstWhere((o) => o.to == recipient).value,
      20000,
    );
    expect(
      decoded.result!.firstWhere((o) => o.to == LibBitcoin.minerOutput).value,
      fee.result!.absolute,
    );

    final watchOnlySign = lib.signTransaction(
      descriptor: d.pub,
      unsignedPSBT: psbt.result!.psbt,
    );
    expect(watchOnlySign.result?.isFinalized ?? false, false);

    final signed = lib.signTransaction(
      descriptor: d.prv,
      unsignedPSBT: psbt.result!.psbt,
    );
    expect(signed.hasError, false, reason: signed.error);
    expect(signed.result!.isFinalized, true);

    // Pretend we broadcast it, then replace it with a higher fee.
    final tx = bdk.Psbt(psbtBase64: signed.result!.psbt).extractTx();
    _applyUnconfirmed(dbPath, d.pub, tx);
    final history = lib.sqliteHistory(descriptor: d.pub, dbPath: dbPath);
    final spend = history.result!.firstWhere((t) => !t.isReceive());
    expect(spend.sent, 20000);
    expect(spend.fee, fee.result!.absolute);

    final bumped = lib.sqliteBumpFee(
      descriptor: d.pub,
      dbPath: dbPath,
      txid: spend.txid,
      feeRate: '10',
    );
    expect(bumped.hasError, false, reason: bumped.error);
    final bumpedDecoded =
        lib.decodePsbt(network: network, psbt: bumped.result!.psbt);
    final bumpedFee = bumpedDecoded.result!
        .firstWhere((o) => o.to == LibBitcoin.minerOutput)
        .value;
    expect(bumpedFee, greaterThan(fee.result!.absolute));
    expect(
      bumpedDecoded.result!.firstWhere((o) => o.to == recipient).value,
      20000,
    );
    final bumpSigned = lib.signTransaction(
      descriptor: d.prv,
      unsignedPSBT: bumped.result!.psbt,
    );
    expect(bumpSigned.result!.isFinalized, true);
  });

  test('taproot wallet signs offline', () {
    final d = descriptors(importedWords, '86', 'tr');
    final dbPath = '${tmp.path}/tr.db';
    final receive = lib.lastUnusedAddress(descriptor: d.pub, dbPath: dbPath);
    _fund(dbPath, d.pub, receive.result!.address, 50000);
    final psbt = lib.sqliteBuildTransaction(
      descriptor: d.pub,
      dbPath: dbPath,
      txOutputs: 'tb1qw2c3lxufxqe2x9s4rdzh65tpf4d7fssjgh8nv6:0',
      feeAbsolute: '300',
      policyPath: '',
      sweep: 'true',
    );
    expect(psbt.hasError, false, reason: psbt.error);
    final signed =
        lib.signTransaction(descriptor: d.prv, unsignedPSBT: psbt.result!.psbt);
    expect(signed.result!.isFinalized, true);
  });
}

void _applyUnconfirmed(String dbPath, String descriptor, bdk.Transaction tx) {
  final persister = bdk.Persister.newSqlite(path: '$dbPath.bdk');
  final wallet = bdk.Wallet.loadSingle(
    descriptor: bdk.Descriptor(
      descriptor: descriptor,
      networkKind: bdk.NetworkKind.test,
    ),
    persister: persister,
    lookahead: 25,
  );
  wallet.applyUnconfirmedTxs(
    unconfirmedTxs: [
      bdk.UnconfirmedTx(
        tx: tx,
        lastSeen: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      ),
    ],
  );
  wallet.persist(persister: persister);
}

/// Injects an unconfirmed transaction paying [sats] to [address].
void _fund(String dbPath, String descriptor, String address, int sats) {
  final script = bdk.Address(address: address, network: bdk.Network.testnet)
      .scriptPubkey()
      .toBytes();
  final raw = BytesBuilder()
    ..add(_le(2, 4)) // version
    ..addByte(1) // input count
    ..add(List.filled(32, 7)) // dummy prevout txid
    ..add(_le(0, 4)) // prevout index
    ..addByte(0) // empty scriptSig
    ..add(_le(0xfffffffd, 4)) // sequence
    ..addByte(1) // output count
    ..add(_le(sats, 8))
    ..addByte(script.length)
    ..add(script)
    ..add(_le(0, 4)); // locktime
  _applyUnconfirmed(
    dbPath,
    descriptor,
    bdk.Transaction(transactionBytes: raw.toBytes()),
  );
}

List<int> _le(int value, int bytes) =>
    [for (var i = 0; i < bytes; i++) (value >> (8 * i)) & 0xff];
