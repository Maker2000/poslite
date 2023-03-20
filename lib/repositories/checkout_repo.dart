import 'package:poslite/models/checkout/checkout.dart';
import 'package:poslite/models/shop_item/shop_item.dart';
import 'package:poslite/repositories/database_connection/database_connection.dart';
import 'package:poslite/repositories/database_connection/util.dart';
import 'package:poslite/repositories/generic_repos.dart';

class CheckoutRepository implements IGenericRepository<Checkout> {
  @override
  Future<void> addItem(Checkout item, [String? docId]) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(String docId) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  final String _getAllItems =
      '''select $checkoutdatabaseitemTableName.${NameOfCheckOutDatabaseItem.id}}, 
      $checkoutdatabaseitemTableName.${NameOfCheckOutDatabaseItem.amount},
      $checkoutdatabaseitemTableName.${NameOfCheckOutDatabaseItem.barcodeId},
      $shopitemTableName.${NameOfShopItem.name},
      $shopitemTableName.${NameOfShopItem.price}
      from $checkoutdatabaseitemTableName
      inner join $shopitemTableName on  $checkoutdatabaseitemTableName.${NameOfCheckOutDatabaseItem.barcodeId} =  $shopitemTableName.${NameOfShopItem.barcodeId}
    ''';
  @override
  // TODO: implement getAllItems
  Future<List<Checkout>> get getAllItems async {
    var items =
        await DatabaseConnection.instance.database?.rawQuery(_getAllItems);
    if (items == null) return [];
    if (items.isEmpty) return [];
    return items.map((e) => Checkout.fromJson(e)).toList();
  }

  @override
  Future<Checkout?> getItem(String documentId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<List<Checkout>> getItemsPaginated(int skip, int count) async {
    var items = await DatabaseConnection.instance.database
        ?.rawQuery("$_getAllItems limit $count offset $skip");
    if (items == null) return [];
    if (items.isEmpty) return [];
    return items.map((e) => Checkout.fromJson(e)).toList();
  }

  @override
  Future<void> updateItem(Checkout item, String docId) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
