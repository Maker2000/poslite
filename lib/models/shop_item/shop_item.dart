import 'package:codemaker_annotations/codemaker_annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:poslite/repositories/database_connection/util.dart';

part 'shop_item.freezed.dart';
part 'shop_item.g.dart';

ShopItem shopItemFromJson(String str) => ShopItem.fromJson(json.decode(str));

String shopItemToJson(ShopItem data) => json.encode(data.toJson());

@unfreezed
@nameof
class ShopItem with _$ShopItem implements DatabaseItem<ShopItem> {
  factory ShopItem({
    String? barcodeId,
    String? name,
    required int amount,
    required double price,
    int? id,
  }) = _ShopItem;

  ShopItem._();
  factory ShopItem.fromJson(Map<String, dynamic> json) =>
      _$ShopItemFromJson(json);
  double get totalCost => amount * price;
  factory ShopItem.empty() => ShopItem(name: '', amount: 0, price: 0.0);
  static Map<String, dynamic> tojson(ShopItem json) => json.toJson();

  @override
  String get tableName => shopitemTableName;

  factory ShopItem.fromDatabaseJson(Map<String, dynamic> obj) =>
      _$ShopItemFromJson(obj);

  @override
  Map<String, dynamic> toDatabaseJson() => toJson();

  @override
  Map<String, Type> createDatabaseMap() {
    var data = NameOfShopItem.nameAndTypeOfShopItemMap;
    data.remove(NameOfShopItem.id);
    return data;
  }
}
