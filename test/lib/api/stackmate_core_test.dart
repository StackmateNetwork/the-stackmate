// ignore: avoid_escaping_inner_quotes
import 'package:sats/api/stackmate-core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BitcoinFFI libstackmate;

  setUp(() {
    libstackmate = BitcoinFFI();
  });

  test('Create New Wallet Flow', () async {
    var root = libstackmate.generateMaster(
        length: 'as', passphrase: '', network: 'test');

    assert(!root.hasError);

    const myAddress0 = 'tb1q6aw9ehm7zg7ppp5v0xdz3guwwu3fdehpypf6e2';
    const myImportedWords =
        'transfer spare party divorce screen used pole march warfare another balance find';

    root = libstackmate.importMaster(
        mnemonic: myImportedWords, passphrase: '', network: 'test');

    assert(!root.hasError);

    final accountMasterKey = libstackmate.deriveHardened(
        masterXPriv: root.result!.xprv, account: "0", purpose: "84");

    assert(!accountMasterKey.hasError);

    final readablePolicy = 'wpkh(___primary___)';
    final spenderPolicy =
        'pk([${accountMasterKey.result!.fingerPrint}${accountMasterKey.result!.hardenedPath.substring(1)}]${accountMasterKey.result!.xprv}/*)';
    final watcherPolicy =
        'pk([${accountMasterKey.result!.fingerPrint}${accountMasterKey.result!.hardenedPath.substring(1)}]${accountMasterKey.result!.xpub}/*)';

    final privateDescriptor =
        libstackmate.compile(policy: spenderPolicy, scriptType: 'wpkh');
    assert(!privateDescriptor.hasError);

    final publicDescriptor =
        libstackmate.compile(policy: watcherPolicy, scriptType: 'wpkh');
    assert(!publicDescriptor.hasError);

    final ffiAddress0 = libstackmate.getAddress(
        descriptor: publicDescriptor.result!, index: '0');
    assert(!ffiAddress0.hasError);
    assert(ffiAddress0.result! == myAddress0);

    final balance = libstackmate.syncBalance(
        descriptor: publicDescriptor.result!, nodeAddress: "default");
    assert(!balance.hasError);
    assert(balance.result! > 0);
  });
}
