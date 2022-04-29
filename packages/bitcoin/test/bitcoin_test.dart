// ignore: avoid_escaping_inner_quotes
import 'package:bitcoin/bitcoin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:ffi';

void main() {
  late FFFI ffi;

  setUp(() {
    ffi = FFFI(
      binary: DynamicLibrary.open(
          '/Users/i5hi/Code/stackmate/stackmate-core/target/debug/libstackmate.dylib'),
    );
  });

  test('Libstackmate Test', () async {
    final ffiMaster = await ffi.generateMaster(
      network: 'test',
      length: '12',
      passphrase: '',
    );
    final master = Seed.fromJson(ffiMaster);
    // For new users

    // For importing
    // Test imports to get the same result each time
    // It is safe to send tBTC to this address
    const myAddress0 = 'tb1q6aw9ehm7zg7ppp5v0xdz3guwwu3fdehpypf6e2';
    const myImportedWords =
        'transfer spare party divorce screen used pole march warfare another balance find';
    final ffiImportedMaster = await ffi.importMaster(
        network: 'test', mnemonic: myImportedWords, passphrase: "");

    final importedMaster = Seed.fromJson(ffiImportedMaster);

    final ffiAccountParent = await ffi.deriveHardened(
      masterXPriv: importedMaster.xprv,
      purpose: '84',
      account: '0',
    );
    // Dont need master keys anymore

    final accountParent = DerivedKeys.fromJson(ffiAccountParent);

    final readablePolicy = 'wpkh(___MYKEY___)';
    final spenderPolicy =
        'pk([${accountParent.fingerPrint}${accountParent.hardenedPath.substring(1)}]${accountParent.xprv}/*)';
    final watcherPolicy =
        'pk([${accountParent.fingerPrint}${accountParent.hardenedPath.substring(1)}]${accountParent.xpub}/*)';

    final privateDescriptor =
        await ffi.compile(policy: spenderPolicy, scriptType: 'wpkh');
    print(privateDescriptor);
    final publicDescriptor =
        await ffi.compile(policy: watcherPolicy, scriptType: 'wpkh');
    print(publicDescriptor);

    final ffiAddress0 =
        await ffi.getAddress(descriptor: publicDescriptor, index: '0');
    print(ffiAddress0);
    assert(ffiAddress0 == myAddress0);

    final balance =
        ffi.syncBalance(descriptor: publicDescriptor, nodeAddress: "default");
    print(balance);
  });
}
