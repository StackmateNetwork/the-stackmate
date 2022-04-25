import 'dart:ffi';

import 'package:bitcoin/bitcoin.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  late FFFI ffi;

  setUp(() {
    ffi = FFFI(
      binary: DynamicLibrary.open('libstackmate.dylib'),
    );
  });

  test('test generate flow', () async {
    final neu = await ffi.generateMaster(
      network: 'test',
      length: '12',
      passphrase: '',
    );

    print(neu);
  });
}
