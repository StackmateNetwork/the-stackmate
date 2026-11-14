import 'package:sats/model/result.dart';

abstract class IStorage {
  Future<R<int>> saveItem<T>(String cls, T obj);
  Future<R<bool>> clearAll<T>(String cls);
  R<T> getItem<T>(String cls, int idx);
  R<List<T>> getAll<T>(String cls);
  R<T> getFirstItem<T>(String cls);
  Future<R<bool>> saveItemAt<T>(String cls, int idx, T obj);
  R<bool> deleteItemAt<T>(String cls, int idx);
}
