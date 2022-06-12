import 'package:cloud_firestore/cloud_firestore.dart';

/// [IGenericRepository] a part of the repository pattern.
abstract class IGenericRepository<T> {
  /// This gets all the items of a specific type [T]. Returns a [CollectionReference]
  CollectionReference<T> get getAllItems;
  Future<T?> getItem(String documentId);
  Future<void> addItem(T item, [String? docId]);
  Future<void> updateItem(T item, String docId);
  Future<void> deleteItem(String docId);
  DocumentReference<T> streamItem(String id) {
    return getAllItems.doc(id);
  }
}
