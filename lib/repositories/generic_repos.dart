import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IRepository<T> {
  CollectionReference<T> get getAllItems;
  Future<T?> getItem(String documentId);
  Future<void> addItem(T item);
  Future<void> updateItem(T item, String docId);
  Future<void> deleteItem(String docId);
}
