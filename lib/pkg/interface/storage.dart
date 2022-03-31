import 'package:sats/model/result.dart';

abstract class IStorage {
  Future<R<int>> saveItem<T>(String cls, T obj);
  R<bool> deleteItem<T>(String cls, String key);
  Future<R<bool>> clearAll<T>(String cls);
  R<T> getItem<T>(String cls, String key);
  R<List<T>> getAll<T>(String cls);
  Future<R<bool>> saveOrUpdateOne(String key, String value);
  Future<R<String>> getOne(String key);
  Future<R<bool>> deleteOne(String key);
  R<T> getFirstItem<T>(String cls);
  R<T?> getFirstItemOrNull<T>(String cls);
  Future<R<bool>> saveItemAt<T>(String cls, int idx, T obj);
  R<bool> deleteItemAt<T>(String cls, int idx);
}
