// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreTransaction _$$_StoreTransactionFromJson(Map<String, dynamic> json) =>
    _$_StoreTransaction(
      items: (json['items'] as List<dynamic>)
          .map((e) => ShopItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
      transactionType: json['transactionType'] as String,
    );

Map<String, dynamic> _$$_StoreTransactionToJson(_$_StoreTransaction instance) =>
    <String, dynamic>{
      'items': instance.items,
      'date': const TimestampConverter().toJson(instance.date),
      'transactionType': instance.transactionType,
    };
