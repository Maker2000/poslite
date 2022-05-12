import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:poslite/models/shop_item/shop_item.dart';

import '../../util/useful_extensions.dart';

part 'sales.freezed.dart';
part 'sales.g.dart';

Sales salesFromJson(String str) => Sales.fromJson(json.decode(str));

String salesToJson(Sales data) => json.encode(data.toJson());

@unfreezed
class Sales with _$Sales {
  factory Sales({
    @JsonKey(name: 'items')
    @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
        required List<ShopItem> items,
    @JsonKey(name: 'date') @TimestampConverter() required Timestamp date,
  }) = _Sales;

  factory Sales.fromJson(Map<String, dynamic> json) => _$SalesFromJson(json);
  static Map<String, dynamic> toJ(Sales json) => json.toJson();
}
