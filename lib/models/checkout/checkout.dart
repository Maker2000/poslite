import 'package:codemaker_annotations/codemaker_annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poslite/repositories/database_connection/util.dart';

part 'checkout.freezed.dart';
part 'checkout.g.dart';

@freezed
@nameof
class CheckOutDatabaseItem
    with _$CheckOutDatabaseItem
    implements DatabaseItem<CheckOutDatabaseItem> {
  factory CheckOutDatabaseItem({
    required int id,
    required String barcodeId,
    required int amount,
  }) = _CheckOutDatabaseItem;

  factory CheckOutDatabaseItem.fromJson(Map<String, dynamic> json) =>
      _$CheckOutDatabaseItemFromJson(json);
  factory CheckOutDatabaseItem.fromDatabaseJson(Map<String, dynamic> obj) =>
      _$CheckOutDatabaseItemFromJson(obj);
  factory CheckOutDatabaseItem.empty() =>
      CheckOutDatabaseItem(id: 0, barcodeId: '', amount: 0);

  CheckOutDatabaseItem._();
  @override
  Map<String, Type> createDatabaseMap() =>
      NameOfCheckOutDatabaseItem.nameAndTypeOfCheckOutDatabaseItemMap;

  @override
  String get tableName => checkoutTableName;

  @override
  Map<String, dynamic> toDatabaseJson() => toJson();
}

@freezed
@nameof
class Checkout with _$Checkout {
  factory Checkout({
    required int id,
    required String barcodeId,
    required int amount,
    required double price,
    required String? name,
  }) = _Checkout;

  factory Checkout.fromJson(Map<String, dynamic> json) =>
      _$CheckoutFromJson(json);

  factory Checkout.fromDatabaseJson(Map<String, dynamic> obj) =>
      _$CheckoutFromJson(obj);
}
