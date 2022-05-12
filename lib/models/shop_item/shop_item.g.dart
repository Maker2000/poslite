// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopItem _$$_ShopItemFromJson(Map<String, dynamic> json) => _$_ShopItem(
      name: json['name'] as String?,
      amount: json['amount'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ShopItemToJson(_$_ShopItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'price': instance.price,
    };
