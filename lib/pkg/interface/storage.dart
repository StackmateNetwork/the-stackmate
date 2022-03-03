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
