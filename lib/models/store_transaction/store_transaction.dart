import 'package:codemaker_annotations/codemaker_annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../../repositories/database_connection/util.dart';
import '../../util/magic_strings.dart';
import '../shop_item/shop_item.dart';

import '../../util/useful_extensions.dart';

part 'store_transaction.freezed.dart';
part 'store_transaction.g.dart';

StoreTransaction storeTransactionFromJson(String str) =>
    StoreTransaction.fromJson(json.decode(str));

String storeTransactionToJson(StoreTransaction data) =>
    json.encode(data.toJson());

@unfreezed
@nameof
class StoreTransaction
    with _$StoreTransaction
    implements DatabaseItem<StoreTransaction> {
  factory StoreTransaction({
    required int id,
    required ShopItem item,
    required DateTime date,
    required TransactionType transactionType,
  }) = _StoreTransaction;
  StoreTransaction._();
  factory StoreTransaction.empty() => StoreTransaction(
      id: 0,
      item: ShopItem.empty(),
      date: DateTime.now(),
      transactionType: TransactionType.sale);
  factory StoreTransaction.fromJson(Map<String, dynamic> json) =>
      _$StoreTransactionFromJson(json);
  static Map<String, dynamic> toJ(StoreTransaction json) => json.toJson();

  factory StoreTransaction.fromDatabaseJson(Map<String, dynamic> obj) {
    var itemData = ShopItem.fromJson(obj);
    var transactionData = StoreTransaction.fromJson(obj);
    return transactionData.copyWith(item: itemData);
  }

  @override
  String get tableName => storetransactionTableName;

  @override
  Map<String, dynamic> toDatabaseJson() {
    var itemMap = item.toJson();
    var transactionMap = toJson();
    transactionMap.remove(NameOfStoreTransaction.item);
    transactionMap.addAll(itemMap);
    return transactionMap;
  }

  @override
  Map<String, Type> createDatabaseMap() {
    var data = NameOfStoreTransaction.nameAndTypeOfStoreTransactionMap;
    data.remove(NameOfStoreTransaction.item);
    data.remove(NameOfStoreTransaction.id);
    data.addAll(NameOfShopItem.nameAndTypeOfShopItemMap);
    data.remove(NameOfShopItem.id);
    return data;
  }
}
