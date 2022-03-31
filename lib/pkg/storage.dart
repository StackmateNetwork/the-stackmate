// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore_for_file: constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/address-book.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/node.dart';
import 'package:sats/model/reddit-post.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/interface/storage.dart';

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

class HiveStore implements IStorage {
  final _box = Hive.box<String>('storage');

  @override
  R<bool> saveItem<T>(String cls, T obj) {
    try {
      Hive.box<T>(cls).add(obj);
      return const R(result: true);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<bool> deleteItem<T>(String cls, String key) {
    try {
      Hive.box<T>(cls).delete(key);
      return const R(result: true);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  Future<R<bool>> clearAll<T>(String cls) async {
    try {
      await Hive.box<T>(cls).clear();
      return const R(result: true);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<T> getItem<T>(String cls, String key) {
    try {
      return R(result: Hive.box<T>(cls).get(key));
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<List<T>> getAll<T>(String cls) {
    try {
      return R(result: Hive.box<T>(cls).values.toList());
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  Future<R<bool>> saveOrUpdateOne(String key, String value) async {
    try {
      _box.put(key, value);
      return const R(result: true);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
    // Hive.box<String>(key).add(value);

    // var _box = await Hive.openBox(_store);
    // await _box.put(key, value);
  }

  @override
  Future<R<String>> getOne(String key) async {
    try {
      final str = _box.get(key);
      if (str == null) {
        throw 'empty';
      }
      return R(result: str);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
    // var _box = await Hive.openBox<String>(_store);
    // var result = _box.get(key);
    // try {
    //   final obj = Hive.box<String>(key).getAt(0);
    //   if (obj == null) throw 'empty';
    //   return obj;
    // } catch (e) {
    //   throw 'empty';
    // }
    // if ((key == StoreKeys.token.name || key == StoreKeys.phone.name) &&
    //     (result == null || result == '')) {
    //   throw 'No key';
    // }

    // if (result == null) throw 'no key';

    // return result;
  }

  @override
  Future<R<bool>> deleteOne(String key) async {
    try {
      _box.delete(key);
      // final b = Hive.box<String>(key);
      // b.deleteAt(0); //.delete(key);
      // var _box = await Hive.openBox(_store);
      // await _box.delete(key);
      return const R(result: true);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<T> getFirstItem<T>(String cls) {
    try {
      final bx = Hive.box<T>(cls);
      // if (bx.isEmpty) throw 'empty';
      final len = bx.length;
      if (len == 0) throw 'empty';
      final obj = bx.getAt(0);
      if (obj == null) throw 'empty';
      return R(result: obj);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<T?> getFirstItemOrNull<T>(String cls) {
    try {
      final bx = Hive.box<T>(cls);
      final len = bx.length;
      if (len == 0) return throw '';
      final obj = bx.getAt(0);
      return R(result: obj);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }
}
