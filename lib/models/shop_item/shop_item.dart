import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'shop_item.freezed.dart';
part 'shop_item.g.dart';

ShopItem shopItemFromJson(String str) => ShopItem.fromJson(json.decode(str));

String shopItemToJson(ShopItem data) => json.encode(data.toJson());

@unfreezed
class ShopItem with _$ShopItem {
  factory ShopItem({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'amount') required int amount,
    @JsonKey(name: 'price') required double price,
  }) = _ShopItem;

  factory ShopItem.fromJson(Map<String, dynamic> json) =>
      _$ShopItemFromJson(json);

  factory ShopItem.empty() => ShopItem(name: '', amount: 0, price: 0.0);
  static Map<String, dynamic> tojson(ShopItem json) => json.toJson();
}
