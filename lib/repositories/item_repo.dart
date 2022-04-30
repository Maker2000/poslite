import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poslite/models/shop_item.dart';

import 'generic_repos.dart';

class ProductRepository implements IRepository<ShopItem> {
  ProductRepository._inst();
  static final ProductRepository _instance = ProductRepository._inst();

  static ProductRepository get instance => _instance;
  @override
  CollectionReference<ShopItem> get getAllItems =>
      FirebaseFirestore.instance.collection('inventory').withConverter(
            fromFirestore: (snapshot, _) => ShopItem.fromJson(snapshot.data()!),
            toFirestore: (ShopItem model, _) => model.toJson(),
          );

  @override
  Future<ShopItem?> getItem(String documentId) async =>
      (await getAllItems.doc(documentId).get()).data();
  @override
  Future<void> addItem(ShopItem item, String id) async {
    DocumentSnapshot<ShopItem> items = await getAllItems.doc(id).get();
    if (items.data() == null) {
      await getAllItems.doc(id).set(item);
    } else {
      item.amount += items.data()!.amount;
      item.price = items.data()!.price;
      item.name = items.data()!.name;
      await getAllItems.doc(items.id).update(item.toJson());
    }
  }

  @override
  Future<void> updateItem(ShopItem item, String docId) async =>
      await getAllItems.doc(docId).update(item.toJson());
  @override
  Future<void> deleteItem(String docId) async =>
      await getAllItems.doc(docId).delete();

  Future<List<QueryDocumentSnapshot<ShopItem>>> _queryDataBaseSingle(
          String data) async =>
      (await getAllItems.where("name", isEqualTo: data).get()).docs;

  automatedUpload() async {
    var files = await FirebaseFirestore.instance
        .collection('fromCollection')
        .snapshots()
        .first;
    for (var file in files.docs) {
      Map<String, dynamic> data = file.data();
      data.addAll({"tag": "foodtag"});
      FirebaseFirestore.instance.collection('toCollection').add(data);
    }
  }
}
