import 'package:hive_flutter/hive_flutter.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/fees.dart';
import 'package:sats/model/node.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
import 'package:test/test.dart';

void main() {
  group('Hive Tests', () {
    late IStorage store;

    setUp(() async {
      // await initializeHive();
      // store = HiveStore();
    });
    tearDown(() {});

    test('Test hive basic CRUD ops', () async {});
  });
}
