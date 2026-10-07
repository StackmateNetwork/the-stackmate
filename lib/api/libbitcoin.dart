import 'dart:typed_data';

import 'package:bdk_dart/bdk.dart' as bdk;
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/model/core.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/transaction.dart';

/// Bitcoin wallet engine backed by BDK (bdk_dart).
///
/// Every call is stateless from the caller's point of view: wallets are
/// identified by their descriptor and (optionally) a sqlite path, which
/// keeps the API safe to use from `compute` isolates. All BDK calls block,
/// so anything touching the network must be run off the UI isolate.
class LibBitcoin implements IStackMateBitcoin {
  static const _lookahead = 25;
  static const _stopGap = 25;
  static const _batchSize = 25;
  static const _electrumTimeoutSecs = 30;
  static const _electrumRetry = 3;
  static const _sweepAmount = '0';

  @override
  R<Seed> generateMaster({
    required String length,
    required String passphrase,
    required String network,
  }) =>
      _guard(() {
        final mnemonic = bdk.Mnemonic(wordCount: _wordCount(length));
        return _seedFrom(mnemonic, passphrase, network);
      });

  @override
  bool isValidMnemonic(String mnemonic) {
    try {
      bdk.Mnemonic.fromString(mnemonic: mnemonic.trim());
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  R<Seed> importMaster({
    required String mnemonic,
    required String passphrase,
    required String network,
  }) =>
      _guard(() {
        final m = bdk.Mnemonic.fromString(mnemonic: mnemonic.trim());
        return _seedFrom(m, passphrase, network);
      });

  @override
  R<DerivedKeys> deriveHardened({
    required String masterXPriv,
    required String account,
    required String purpose,
  }) =>
      _guard(() {
        final coin = masterXPriv.startsWith('tprv') ? '1' : '0';
        final path = "m/$purpose'/$coin'/$account'";
        final root = bdk.DescriptorSecretKey.fromString(
          privateKey: masterXPriv,
        );
        final child = root.derive(path: bdk.DerivationPath(path: path));
        final xprv = _parseKey(child.toString());
        final xpub = _parseKey(child.asPublic().toString());
        return DerivedKeys(xprv.fingerprint, 'm/${xprv.path}', xprv.key, xpub.key);
      });

  @override
  R<String> compile({
    required String policy,
    required String scriptType,
  }) =>
      _guard(() {
        final p = policy.trim();
        final key = RegExp(r'^pk\((.+)\)$').firstMatch(p)?.group(1);
        final String raw;
        switch (scriptType) {
          case 'wpkh':
          case 'tr':
            if (key == null) {
              throw ArgumentError('$scriptType only supports a pk() policy');
            }
            raw = '$scriptType($key)';
          case 'wsh':
            raw = 'wsh(${_policyToMiniscript(p)})';
          default:
            throw ArgumentError('Unsupported script type: $scriptType');
        }
        final desc = _descriptor(raw);
        return _hasSecret(raw) ? desc.toStringWithSecret() : desc.toString();
      });

  @override
  R<double> estimateNetworkFee({
    required String targetSize,
    required String network,
    required String nodeAddress,
    required String socks5,
  }) =>
      _guard(() {
        final client = _electrum(nodeAddress, socks5);
        final btcPerKvb = client.estimateFee(number: int.parse(targetSize));
        // Electrum returns BTC/kvB, or -1 when it has no estimate.
        final satPerVb = btcPerKvb * satsPerBtc / 1000;
        if (satPerVb < 1) return 1.0;
        return double.parse(satPerVb.toStringAsFixed(2));
      });

  @override
  R<int> getWeight({
    required String descriptor,
    required String psbt,
  }) =>
      _guard(() {
        final tx = bdk.Psbt(psbtBase64: psbt).extractTxUncheckedFeeRate();
        final perInput = _descriptor(descriptor).maxWeightToSatisfy();
        // unsigned weight + segwit marker/flag + worst-case witness per input
        return tx.weight() + 2 + tx.input().length * perInput;
      });

  @override
  R<NetworkFees> feeAbsoluteToRate({
    required String feeAbsolute,
    required String weight,
  }) =>
      _guard(() {
        final abs = int.parse(feeAbsolute);
        final vbytes = int.parse(weight) / 4;
        return NetworkFees(abs / vbytes, abs);
      });

  @override
  R<NetworkFees> feeRateToAbsolute({
    required String feeRate,
    required String weight,
  }) =>
      _guard(() {
        final rate = double.parse(feeRate);
        final vbytes = int.parse(weight) / 4;
        return NetworkFees(rate, (rate * vbytes).ceil());
      });

  @override
  R<String> sqliteSync({
    required String dbPath,
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  }) =>
      _guard(() {
        final (wallet, persister) = _openWallet(descriptor, dbPath);
        _fullScan(wallet, nodeAddress, socks5);
        wallet.persist(persister: persister);
        return 'synced';
      });

  @override
  R<int> sqliteBalance({
    required String descriptor,
    required String dbPath,
  }) =>
      _guard(() {
        final (wallet, _) = _openWallet(descriptor, dbPath);
        return wallet.balance().total.toSat();
      });

  @override
  R<int> syncBalance({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  }) =>
      _guard(() {
        final wallet = _syncedMemoryWallet(descriptor, nodeAddress, socks5);
        return wallet.balance().total.toSat();
      });

  @override
  R<int> getHeight({
    required String network,
    required String nodeAddress,
    required String socks5,
  }) =>
      _guard(() {
        return _electrum(nodeAddress, socks5).blockHeadersSubscribe().height;
      });

  @override
  R<List<Transaction>> sqliteHistory({
    required String descriptor,
    required String dbPath,
  }) =>
      _guard(() {
        final (wallet, _) = _openWallet(descriptor, dbPath);
        return _history(wallet);
      });

  @override
  R<List<Transaction>> getHistory({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  }) =>
      _guard(() {
        final wallet = _syncedMemoryWallet(descriptor, nodeAddress, socks5);
        return _history(wallet);
      });

  @override
  R<List<UTXO>> getUTXOSet({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  }) =>
      _guard(() {
        final wallet = _syncedMemoryWallet(descriptor, nodeAddress, socks5);
        return [
          for (final u in wallet.listUnspent())
            UTXO(
              u.outpoint.txid.toString(),
              u.outpoint.vout,
              u.txout.value.toSat(),
              _hex(u.txout.scriptPubkey.toBytes()),
              u.keychain == bdk.KeychainKind.internal ? 'internal' : 'external',
            ),
        ];
      });

  @override
  R<String> getAddress({
    required String descriptor,
    required String index,
  }) =>
      _guard(() {
        return _descriptor(descriptor)
            .deriveAddress(
              index: int.parse(index),
              network: _networkOfDescriptor(descriptor),
            )
            .toString();
      });

  @override
  R<Address> lastUnusedAddress({
    required String descriptor,
    required String dbPath,
  }) =>
      _guard(() {
        final (wallet, persister) = _openWallet(descriptor, dbPath);
        final info =
            wallet.nextUnusedAddress(keychain: bdk.KeychainKind.external_);
        wallet.persist(persister: persister);
        return Address(info.address.toString(), info.index.toString());
      });

  @override
  R<PSBT> sqliteBuildTransaction({
    required String descriptor,
    required String dbPath,
    required String txOutputs,
    required String feeAbsolute,
    required String policyPath,
    required String sweep,
  }) =>
      _guard(() {
        final (wallet, persister) = _openWallet(descriptor, dbPath);
        final psbt = _buildPsbt(wallet, descriptor, txOutputs, feeAbsolute, sweep);
        wallet.persist(persister: persister);
        return psbt;
      });

  @override
  R<PSBT> buildTransaction({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String txOutputs,
    required String feeAbsolute,
    required String policyPath,
    required String sweep,
  }) =>
      _guard(() {
        final wallet = _syncedMemoryWallet(descriptor, nodeAddress, socks5);
        return _buildPsbt(wallet, descriptor, txOutputs, feeAbsolute, sweep);
      });

  @override
  R<PSBT> sqliteBumpFee({
    required String descriptor,
    required String dbPath,
    required String txid,
    required String feeRate,
  }) =>
      _guard(() {
        final (wallet, persister) = _openWallet(descriptor, dbPath);
        final satPerKwu = (double.parse(feeRate) * 250).ceil();
        final psbt = bdk.BumpFeeTxBuilder(
          txid: bdk.Txid.fromString(hex: txid),
          feeRate: bdk.FeeRate.fromSatPerKwu(satKwu: satPerKwu),
        ).finish(wallet: wallet);
        wallet.persist(persister: persister);
        return PSBT(psbt.serialize(), false);
      });

  @override
  R<List<DecodedTxOutput>> decodePsbt({
    required String network,
    required String psbt,
  }) =>
      _guard(() {
        final p = bdk.Psbt(psbtBase64: psbt);
        final net = _network(network);
        final outputs = [
          for (final o in p.extractTxUncheckedFeeRate().output())
            DecodedTxOutput(
              o.value.toSat(),
              bdk.Address.fromScript(script: o.scriptPubkey, network: net)
                  .toString(),
            ),
        ];
        outputs.add(DecodedTxOutput(p.fee(), minerOutput));
        return outputs;
      });

  @override
  R<PSBT> signTransaction({
    required String descriptor,
    required String unsignedPSBT,
  }) =>
      _guard(() {
        final wallet = bdk.Wallet.createSingle(
          descriptor: _descriptor(descriptor),
          network: _networkOfDescriptor(descriptor),
          persister: bdk.Persister.newInMemory(),
          lookahead: _lookahead,
        );
        final psbt = bdk.Psbt(psbtBase64: unsignedPSBT);
        // Finalizing requires the spent scripts to be in the wallet's index.
        final maxIndex = _maxDerivationIndex(psbt);
        if (maxIndex >= _lookahead) {
          wallet.revealAddressesTo(
            keychain: bdk.KeychainKind.external_,
            index: maxIndex,
          );
        }
        final finalized = wallet.sign(
          psbt: psbt,
          signOptions: bdk.SignOptions(
            trustWitnessUtxo: true,
            allowAllSighashes: false,
            tryFinalize: true,
            signWithTapInternalKey: true,
            allowGrinding: true,
          ),
        );
        return PSBT(psbt.serialize(), finalized);
      });

  @override
  Future<R<String>> broadcastTransaction({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String signedPSBT,
  }) async =>
      _guard(() {
        final psbt = bdk.Psbt(psbtBase64: signedPSBT);
        final finalized = psbt.finalize();
        if (!finalized.couldFinalize) {
          throw StateError('PSBT is not fully signed.');
        }
        final tx = finalized.psbt.extractTx();
        return _electrum(nodeAddress, socks5)
            .transactionBroadcast(tx: tx)
            .toString();
      });

  @override
  Future<R<String>> broadcastTransactionHex({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String signedHex,
  }) async =>
      _guard(() {
        final tx = bdk.Transaction(transactionBytes: _unhex(signedHex.trim()));
        return _electrum(nodeAddress, socks5)
            .transactionBroadcast(tx: tx)
            .toString();
      });

  // ---------------------------------------------------------------------------

  static const minerOutput = 'miner';
  static const satsPerBtc = 100000000;

  R<T> _guard<T>(T Function() body) {
    try {
      return R(result: body());
    } catch (e) {
      return R(error: SMError(e.runtimeType.toString(), e.toString()).toJson());
    }
  }

  Seed _seedFrom(bdk.Mnemonic mnemonic, String passphrase, String network) {
    final root = bdk.DescriptorSecretKey(
      networkKind: _networkKind(_network(network)),
      mnemonic: mnemonic,
      password: passphrase.isEmpty ? null : passphrase,
    );
    final fingerprint = root.asPublic().masterFingerprint();
    final xprv = root.toString().replaceAll('/*', '');
    return Seed(mnemonic.toString(), fingerprint, xprv);
  }

  bdk.WordCount _wordCount(String length) => switch (length) {
        '12' => bdk.WordCount.words12,
        '15' => bdk.WordCount.words15,
        '18' => bdk.WordCount.words18,
        '21' => bdk.WordCount.words21,
        '24' => bdk.WordCount.words24,
        _ => throw ArgumentError('Invalid mnemonic length: $length'),
      };

  bdk.Network _network(String name) =>
      name == 'main' ? bdk.Network.bitcoin : bdk.Network.testnet;

  bdk.NetworkKind _networkKind(bdk.Network network) =>
      network == bdk.Network.bitcoin ? bdk.NetworkKind.main : bdk.NetworkKind.test;

  bool _hasSecret(String descriptor) =>
      descriptor.contains('xprv') || descriptor.contains('tprv');

  bdk.Network _networkOfDescriptor(String descriptor) =>
      descriptor.contains('tpub') || descriptor.contains('tprv')
          ? bdk.Network.testnet
          : bdk.Network.bitcoin;

  bdk.Descriptor _descriptor(String descriptor) => bdk.Descriptor(
        descriptor: descriptor,
        networkKind: _networkKind(_networkOfDescriptor(descriptor)),
      );

  /// Translates the policies the app produces into miniscript:
  /// `pk(K)` stays as is, `thresh(k,pk(A),pk(B),..)` becomes `sortedmulti`.
  String _policyToMiniscript(String policy) {
    final thresh = RegExp(r'^thresh\((\d+),(.+)\)$').firstMatch(policy);
    if (thresh == null) return policy;
    final keys = RegExp(r'pk\(([^()]+)\)')
        .allMatches(thresh.group(2)!)
        .map((m) => m.group(1))
        .join(',');
    return 'sortedmulti(${thresh.group(1)},$keys)';
  }

  ({String fingerprint, String path, String key}) _parseKey(String s) {
    final m = RegExp(r'^\[([0-9a-fA-F]{8})/([^\]]*)\]([^/]+)').firstMatch(s);
    if (m == null) throw FormatException('Unexpected key format', s);
    return (fingerprint: m.group(1)!, path: m.group(2)!, key: m.group(3)!);
  }

  /// BDK keeps its own sqlite schema, separate from the legacy
  /// stackmate-core database at [dbPath]; chain data is re-synced into it.
  String _bdkDbPath(String dbPath) => '$dbPath.bdk';

  (bdk.Wallet, bdk.Persister) _openWallet(String descriptor, String dbPath) {
    final persister = bdk.Persister.newSqlite(path: _bdkDbPath(dbPath));
    final desc = _descriptor(descriptor);
    try {
      final wallet = bdk.Wallet.loadSingle(
        descriptor: desc,
        persister: persister,
        lookahead: _lookahead,
      );
      return (wallet, persister);
    } catch (_) {
      final wallet = bdk.Wallet.createSingle(
        descriptor: desc,
        network: _networkOfDescriptor(descriptor),
        persister: persister,
        lookahead: _lookahead,
      );
      wallet.persist(persister: persister);
      return (wallet, persister);
    }
  }

  bdk.Wallet _syncedMemoryWallet(
    String descriptor,
    String nodeAddress,
    String socks5,
  ) {
    final wallet = bdk.Wallet.createSingle(
      descriptor: _descriptor(descriptor),
      network: _networkOfDescriptor(descriptor),
      persister: bdk.Persister.newInMemory(),
      lookahead: _lookahead,
    );
    _fullScan(wallet, nodeAddress, socks5);
    return wallet;
  }

  bdk.ElectrumClient _electrum(String nodeAddress, String socks5) =>
      bdk.ElectrumClient(
        url: nodeAddress,
        socks5: socks5.isEmpty || socks5 == 'none' ? null : socks5,
        timeout: _electrumTimeoutSecs,
        retry: _electrumRetry,
        validateDomain: true,
      );

  void _fullScan(bdk.Wallet wallet, String nodeAddress, String socks5) {
    final client = _electrum(nodeAddress, socks5);
    final update = client.fullScan(
      request: wallet.startFullScan().build(),
      stopGap: _stopGap,
      batchSize: _batchSize,
      fetchPrevTxouts: true,
    );
    wallet.applyUpdate(update: update);
  }

  List<Transaction> _history(bdk.Wallet wallet) {
    final transactions = <Transaction>[];
    for (final ct in wallet.transactions()) {
      final tx = ct.transaction;
      final values = wallet.sentAndReceived(tx: tx);
      var fee = 0;
      try {
        fee = wallet.calculateFee(tx: tx).toSat();
      } catch (_) {
        // fee is unknown when previous outputs are not ours / not fetched
      }
      var timestamp = 0;
      var height = 0;
      final position = ct.chainPosition;
      if (position is bdk.ConfirmedChainPosition) {
        timestamp = position.confirmationBlockTime.confirmationTime;
        height = position.confirmationBlockTime.blockId.height;
      }
      var t = Transaction(
        timestamp: timestamp,
        height: height,
        txid: tx.computeTxid().toString(),
        received: values.received.toSat(),
        sent: values.sent.toSat(),
        fee: fee,
      );
      if (!t.isReceive()) t = t.copyWith(sent: t.sent - t.received - t.fee);
      transactions.add(t);
    }
    transactions.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    final unconfirmed = transactions.where((t) => t.timestamp == 0).toList();
    final confirmed = transactions.where((t) => t.timestamp > 0).toList();
    return unconfirmed + confirmed;
  }

  PSBT _buildPsbt(
    bdk.Wallet wallet,
    String descriptor,
    String txOutputs,
    String feeAbsolute,
    String sweep,
  ) {
    final network = _networkOfDescriptor(descriptor);
    var builder = bdk.TxBuilder();
    for (final output in txOutputs.split(',')) {
      final sep = output.lastIndexOf(':');
      final address = output.substring(0, sep).trim();
      final amount = output.substring(sep + 1).trim();
      final script =
          bdk.Address(address: address, network: network).scriptPubkey();
      if (sweep == 'true' || amount == _sweepAmount) {
        builder = builder.drainWallet().drainTo(script: script);
      } else {
        builder = builder.addRecipient(
          script: script,
          amount: bdk.Amount.fromSat(satoshi: int.parse(amount)),
        );
      }
    }
    builder = builder.feeAbsolute(
      feeAmount: bdk.Amount.fromSat(satoshi: int.parse(feeAbsolute)),
    );
    final psbt = builder.finish(wallet: wallet);
    return PSBT(psbt.serialize(), false);
  }

  int _maxDerivationIndex(bdk.Psbt psbt) {
    var max = 0;
    for (final input in psbt.input()) {
      final sources = [
        ...input.bip32Derivation.values,
        ...input.tapKeyOrigins.values.map((o) => o.keySource),
      ];
      for (final source in sources) {
        final path = source.path.toU32Vec();
        if (path.isNotEmpty && path.last > max) max = path.last;
      }
    }
    return max;
  }

  String _hex(Uint8List bytes) =>
      bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

  Uint8List _unhex(String hex) => Uint8List.fromList([
        for (var i = 0; i < hex.length; i += 2)
          int.parse(hex.substring(i, i + 2), radix: 16),
      ]);
}
