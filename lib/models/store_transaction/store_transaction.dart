import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:poslite/models/shop_item/shop_item.dart';

import '../../util/useful_extensions.dart';

part 'store_transaction.freezed.dart';
part 'store_transaction.g.dart';

StoreTransaction storeTransactionFromJson(String str) =>
    StoreTransaction.fromJson(json.decode(str));

String storeTransactionToJson(StoreTransaction data) =>
    json.encode(data.toJson());

@unfreezed
class StoreTransaction with _$StoreTransaction {
  factory StoreTransaction({
    @JsonKey(name: 'items')
    @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
        required List<ShopItem> items,
    @JsonKey(name: 'date') @TimestampConverter() required Timestamp date,
    @JsonKey(name: 'transactionType') required String transactionType,
  }) = _StoreTransaction;

  factory StoreTransaction.fromJson(Map<String, dynamic> json) =>
      _$StoreTransactionFromJson(json);
  static Map<String, dynamic> toJ(StoreTransaction json) => json.toJson();
}
