import 'package:poslite/repositories/database_connection/database_connection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqlite_api.dart';

import 'generic_repos.dart';
import '../models/shop_item/shop_item.dart';
import '../util/secrets.dart';

class ProductRepository implements IGenericRepository<ShopItem> {
  ProductRepository._inst();
  static final ProductRepository _instance = ProductRepository._inst();

  static ProductRepository get instance => _instance;

  @override
  Future<void> addItem(ShopItem item, [String? docId]) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(String docId) async {
    await DatabaseConnection.instance.database?.delete(shopitemTableName,
        where: '${NameOfShopItem.barcodeId} = ?', whereArgs: [docId]);
  }

  @override
  Future<List<ShopItem>> get getAllItems async {
    var items =
        await DatabaseConnection.instance.database?.query(shopitemTableName);
    if (items == null) return [];
    if (items.isEmpty) return [];
    return items.map((e) => ShopItem.fromJson(e)).toList();
  }

  @override
  Future<ShopItem?> getItem(String documentId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<void> updateItem(ShopItem item, String docId) async {
    await DatabaseConnection.instance.database?.insert(
        shopitemTableName, item.toDatabaseJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<List<ShopItem>> getItemsPaginated(int skip, int count) async {
    var items = await DatabaseConnection.instance.database
        ?.query(shopitemTableName, offset: skip, limit: count);
    if (items == null) return [];
    if (items.isEmpty) return [];
    return items.map((e) => ShopItem.fromJson(e)).toList();
  }
}
