// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sales _$$_SalesFromJson(Map<String, dynamic> json) => _$_Sales(
      items: (json['items'] as List<dynamic>)
          .map((e) => ShopItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
    );

Map<String, dynamic> _$$_SalesToJson(_$_Sales instance) => <String, dynamic>{
      'items': instance.items,
      'date': const TimestampConverter().toJson(instance.date),
    };
