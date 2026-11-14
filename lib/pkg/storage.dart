// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/fees.dart';
import 'package:sats/model/node.dart';
import 'package:sats/model/pin.dart';
import 'package:sats/model/preferences.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/interface/storage.dart';

enum StoreKeys {
  Wallet,
  Blockchain,
  Node,
  Fees,
  Preferences,
  Pin,
}

extension StoreKeysFunctions on StoreKeys {
  String get name => const {
        StoreKeys.Wallet: 'wallet',
        StoreKeys.Blockchain: 'blockchain',
        StoreKeys.Node: 'node',
        StoreKeys.Fees: 'fees',
        StoreKeys.Preferences: 'preferences',
        StoreKeys.Pin: 'pin',
      }[this]!;
}

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WalletClassAdapter()); // typeId: 1
  Hive.registerAdapter(BlockchainClassAdapter()); // typeId: 2
  Hive.registerAdapter(NodeClassAdapter()); // typeId: 3
  Hive.registerAdapter(FeesClassAdapter()); // typeId: 4
  Hive.registerAdapter(PreferencesClassAdapter()); // typeId: 5
  Hive.registerAdapter(TransactionClassAdapter()); // typeId: 6
  Hive.registerAdapter(PinClassAdapter()); // typeId: 9

  const secureStorage = FlutterSecureStorage();
  final encryprionKey = await secureStorage.read(key: 'key');
  if (encryprionKey == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: 'key',
      value: base64UrlEncode(key),
    );
  }
  final key = await secureStorage.read(key: 'key');
  final encryptionKey = base64Url.decode(key!);

  await Hive.openBox<Wallet>(
    StoreKeys.Wallet.name,
    encryptionCipher: HiveAesCipher(encryptionKey),
  );
  await Hive.openBox<Blockchain>(
    StoreKeys.Blockchain.name,
    encryptionCipher: HiveAesCipher(encryptionKey),
  );
  await Hive.openBox<Node>(
    StoreKeys.Node.name,
    encryptionCipher: HiveAesCipher(encryptionKey),
  );
  await Hive.openBox<Fees>(
    StoreKeys.Fees.name,
    encryptionCipher: HiveAesCipher(encryptionKey),
  );
  await Hive.openBox<Preferences>(
    StoreKeys.Preferences.name,
    encryptionCipher: HiveAesCipher(encryptionKey),
  );

  // Tor was removed; drop its settings box left by older versions.
  if (await Hive.boxExists('tor')) await Hive.deleteBoxFromDisk('tor');
  await Hive.openBox<Pin>(
    StoreKeys.Pin.name,
    encryptionCipher: HiveAesCipher(encryptionKey),
  );
}

class HiveStore implements IStorage {
  @override
  R<T> getFirstItem<T>(String dbName) {
    try {
      final bx = Hive.box<T>(dbName);
      final len = bx.length;
      if (len == 0) return const R(error: 'empty');
      final item = bx.getAt(0);
      if (item == null) return const R(error: 'empty');
      return R(result: item);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  Future<R<int>> saveItem<T>(String dbName, T item) async {
    try {
      final id = await Hive.box<T>(dbName).add(item);
      return R(result: id);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  Future<R<bool>> saveItemAt<T>(String dbName, int index, T item) async {
    try {
      await Hive.box<T>(dbName).put(index, item);
      return const R(result: true);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<T> getItem<T>(String dbName, int index) {
    try {
      return R(result: Hive.box<T>(dbName).get(index));
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<List<T>> getAll<T>(String dbName) {
    try {
      return R(result: Hive.box<T>(dbName).values.toList());
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<bool> deleteItemAt<T>(String dbName, int index) {
    try {
      Hive.box<T>(dbName).delete(index);
      return const R(result: true);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  Future<R<bool>> clearAll<T>(String dbName) async {
    try {
      await Hive.box<T>(dbName).clear();
      return const R(result: true);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }
}
