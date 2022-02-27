// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore_for_file: constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:sats/model/address-book.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/node.dart';
import 'package:sats/model/reddit-post.dart';
import 'package:sats/model/wallet.dart';

enum StoreKeys {
  RedditPost,
  Wallet,
  Blockchain,
  Node,
  AddressBookUser,
  AddressBookKey,
}

extension StoreKeysFunctions on StoreKeys {
  String get name => const {
        StoreKeys.RedditPost: 'reddit-post',
        StoreKeys.Wallet: 'wallet',
        StoreKeys.Blockchain: 'blockchain',
        StoreKeys.Node: 'node',
        StoreKeys.AddressBookUser: 'address-book-user',
        StoreKeys.AddressBookKey: 'address-book-key'
      }[this]!;
}

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RedditPostClassAdapter());
  Hive.registerAdapter(WalletClassAdaper());
  Hive.registerAdapter(InternalWalletClassAdaper());
  Hive.registerAdapter(BlockchainClassAdaper());
  Hive.registerAdapter(AddressBookUserClassAdaper());
  Hive.registerAdapter(AddressBookValueClassAdaper());
  Hive.registerAdapter(NodeClassAdaper());

  await Hive.openBox<RedditPost>(
    StoreKeys.RedditPost.name,
    compactionStrategy: (entries, deletedEntries) => deletedEntries > 50,
  );
  await Hive.openBox<Wallet>(StoreKeys.Wallet.name);
  await Hive.openBox<Blockchain>(StoreKeys.Blockchain.name);
  await Hive.openBox<AddressBookUser>(StoreKeys.AddressBookUser.name);
  await Hive.openBox<AddressBookKey>(StoreKeys.AddressBookKey.name);
  await Hive.openBox<Node>(StoreKeys.Node.name);
}

abstract class IStorage {
  Future<int> saveItem<T>(String cls, T obj);
  Future<void> saveItemAt<T>(String cls, int idx, T obj);

  void deleteItem<T>(String cls, dynamic key);
  void deleteItemAt<T>(String cls, int idx);
  Future<void> clearAll<T>(String cls);

  T getItem<T>(String cls, String key);
  T getFirstItem<T>(String cls);
  List<T> getAll<T>(String cls);
}

class HiveStore implements IStorage {
  @override
  Future<int> saveItem<T>(String cls, T obj) async {
    final id = await Hive.box<T>(cls).add(obj);
    return id;
  }

  @override
  Future<void> saveItemAt<T>(String cls, int idx, T obj) async {
    await Hive.box<T>(cls).put(idx, obj);
  }

  @override
  void deleteItem<T>(String cls, dynamic key) {
    Hive.box<T>(cls).delete(key);
  }

  @override
  void deleteItemAt<T>(String cls, int idx) {
    Hive.box<T>(cls).delete(idx);
  }

  @override
  Future<void> clearAll<T>(String cls) async {
    await Hive.box<T>(cls).clear();
  }

  @override
  T getItem<T>(String cls, String key) {
    final obj = Hive.box<T>(cls).get(key);
    if (obj == null) throw 'empty';
    return obj;
  }

  @override
  List<T> getAll<T>(String cls) {
    return Hive.box<T>(cls).values.toList();
  }

  @override
  T getFirstItem<T>(String cls) {
    final bx = Hive.box<T>(cls);
    if (bx.isEmpty) throw 'empty';
    final obj = bx.getAt(0);
    if (obj == null) throw 'empty';
    return obj;
  }
}
