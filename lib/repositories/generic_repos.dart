import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IGenericRepository<T> {
  CollectionReference<T> get getAllItems;
  Future<T?> getItem(String documentId);
  Future<void> addItem(T item, [String? docId]);
  Future<void> updateItem(T item, String docId);
  Future<void> deleteItem(String docId);
  DocumentReference<T> streamItem(String id) {
    return getAllItems.doc(id);
  }
}
