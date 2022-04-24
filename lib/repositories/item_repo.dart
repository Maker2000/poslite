import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poslite/models/shop_item.dart';
import 'package:poslite/models/user.dart';

import 'generic_repos.dart';

class ProductRepository implements IRepository<ShopItem> {
  @override
  CollectionReference<ShopItem> get getAllItems {
    return FirebaseFirestore.instance.collection('inventory').withConverter(
          fromFirestore: (snapshot, _) => ShopItem.fromJson(snapshot.data()!),
          toFirestore: (ShopItem model, _) => model.toJson(),
        );
  }

  @override
  Future<ShopItem?> getItem(String documentId) async =>
      (await getAllItems.doc(documentId).get()).data();
  @override
  Future<void> addItem(ShopItem item) async => await getAllItems.add(item);
  @override
  Future<void> updateItem(ShopItem item, String docId) async =>
      await getAllItems.doc(docId).update(item.toJson());
  @override
  Future<void> deleteItem(String docId) async =>
      await getAllItems.doc(docId).delete();
}

class UserRepository implements IRepository<User> {
  @override
  CollectionReference<User> get getAllItems {
    return FirebaseFirestore.instance.collection('user').withConverter(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (User model, _) => model.toJson(),
        );
  }

  @override
  Future<User?> getItem(String documentId) async =>
      (await getAllItems.doc(documentId).get()).data();
  @override
  Future<void> addItem(User item) async => await getAllItems.add(item);
  @override
  Future<void> updateItem(User item, String docId) async =>
      await getAllItems.doc(docId).update(item.toJson());
  @override
  Future<void> deleteItem(String docId) async =>
      await getAllItems.doc(docId).delete();
}
