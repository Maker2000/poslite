import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poslite/models/shop_item.dart';

import 'generic_repos.dart';

class ProductRepository implements IRepository<ShopItem> {
  ProductRepository._inst();
  static final ProductRepository _instance = ProductRepository._inst();

  static ProductRepository get instance => _instance;
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
