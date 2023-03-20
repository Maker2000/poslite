/// [IGenericRepository] a part of the repository pattern.
abstract class IGenericRepository<T> {
  /// This gets all the items of a specific type [T]. Returns a [CollectionReference]
  Future<List<T>> get getAllItems;
  Future<List<T>> getItemsPaginated(int skip, int count);
  Future<T?> getItem(String documentId);
  Future<void> addItem(T item, [String? docId]);
  Future<void> updateItem(T item, String docId);
  Future<void> deleteItem(String docId);
  // T streamItem(String id) {
  //   return getAllItems.first;
  // }
}
