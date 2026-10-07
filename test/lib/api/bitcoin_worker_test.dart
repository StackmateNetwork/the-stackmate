import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sats/api/bitcoin_worker.dart';
import 'package:sats/api/libbitcoin.dart';
import 'package:sats/model/core.dart';
import 'package:sats/model/result.dart';

void main() {
  const words =
      'burger arrest eight spin embrace outer green fine couch entry drastic kiwi';

  test('runs wallet calls on a background isolate', () async {
    final lib = LibBitcoin();
    final root =
        lib.importMaster(mnemonic: words, passphrase: '', network: 'test');
    final child = lib.deriveHardened(
      masterXPriv: root.orThrow().xprv,
      account: '0',
      purpose: '84',
    );
    final descriptor = lib
        .compile(policy: 'pk(${child.orThrow().fullXPub}/*)', scriptType: 'wpkh')
        .orThrow();
    final tmp = Directory.systemTemp.createTempSync('stackmate_worker_');
    addTearDown(() => tmp.deleteSync(recursive: true));
    final dbPath = '${tmp.path}/w.db';

    expect(
      (await BitcoinWorker.balance(descriptor: descriptor, dbPath: dbPath))
          .orThrow(),
      0,
    );
    expect(
      (await BitcoinWorker.history(descriptor: descriptor, dbPath: dbPath))
          .orThrow(),
      isEmpty,
    );
  });

  test('importMaster errors surface as readable messages', () async {
    final seed = await BitcoinWorker.importMaster(
      mnemonic: 'not a mnemonic',
      passphrase: '',
      network: 'test',
    );
    expect(seed.hasError, true);
    expect(seed.errorMessage, isNot(contains('"kind"')));
    expect(seed.orThrow, throwsA(seed.errorMessage));
  });

  test('errorMessage decodes SMError JSON and passes plain text through', () {
    expect(
      R<int>(error: const SMError('Kind', 'boom').toJson()).errorMessage,
      'boom',
    );
    expect(const R<int>(error: 'plain').errorMessage, 'plain');
    expect(const R<int>(result: 1).orThrow(), 1);
  });
}
