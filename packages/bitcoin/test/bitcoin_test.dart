// import 'package:bitcoin/bitcoin.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'dart:ffi';

// void main() {
//   late BitcoinFFFI ffi;

//   setUp(() {
//     ffi = BitcoinFFFI(
//       binary: DynamicLibrary.open('libstackmate.dylib'),
//     );
//   });

//   test('test generate flow', () async {
//     final neu = await ffi.generateMaster(
//       mnemonic: '12',
//       passphrase: '',
//       network: '',
//     );

//     final der = await ffi.deriveHardened(
//       masterXPriv: neu.xprv,
//       account: '',
//       purpose: '',
//     );

//     final com = await ffi.compile(
//       policy: der.policy,
//       scriptType: 'wsh',
//     );

//     print('com');
//   });
// }
