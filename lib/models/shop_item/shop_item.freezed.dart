// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopItem _$ShopItemFromJson(Map<String, dynamic> json) {
  return _ShopItem.fromJson(json);
}

/// @nodoc
mixin _$ShopItem {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  set name(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  set amount(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  set price(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopItemCopyWith<ShopItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopItemCopyWith<$Res> {
  factory $ShopItemCopyWith(ShopItem value, $Res Function(ShopItem) then) =
      _$ShopItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'price') double price});
}

/// @nodoc
class _$ShopItemCopyWithImpl<$Res> implements $ShopItemCopyWith<$Res> {
  _$ShopItemCopyWithImpl(this._value, this._then);

  final ShopItem _value;
  // ignore: unused_field
  final $Res Function(ShopItem) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? amount = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_ShopItemCopyWith<$Res> implements $ShopItemCopyWith<$Res> {
  factory _$$_ShopItemCopyWith(
          _$_ShopItem value, $Res Function(_$_ShopItem) then) =
      __$$_ShopItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'price') double price});
}

/// @nodoc
class __$$_ShopItemCopyWithImpl<$Res> extends _$ShopItemCopyWithImpl<$Res>
    implements _$$_ShopItemCopyWith<$Res> {
  __$$_ShopItemCopyWithImpl(
      _$_ShopItem _value, $Res Function(_$_ShopItem) _then)
      : super(_value, (v) => _then(v as _$_ShopItem));

  @override
  _$_ShopItem get _value => super._value as _$_ShopItem;

  @override
  $Res call({
    Object? name = freezed,
    Object? amount = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_ShopItem(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopItem implements _ShopItem {
  _$_ShopItem(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'amount') required this.amount,
      @JsonKey(name: 'price') required this.price});

  factory _$_ShopItem.fromJson(Map<String, dynamic> json) =>
      _$$_ShopItemFromJson(json);

  @override
  @JsonKey(name: 'name')
  String? name;
  @override
  @JsonKey(name: 'amount')
  int amount;
  @override
  @JsonKey(name: 'price')
  double price;

  @override
  String toString() {
    return 'ShopItem(name: $name, amount: $amount, price: $price)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_ShopItemCopyWith<_$_ShopItem> get copyWith =>
      __$$_ShopItemCopyWithImpl<_$_ShopItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopItemToJson(this);
  }
}

abstract class _ShopItem implements ShopItem {
  factory _ShopItem(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'amount') required int amount,
      @JsonKey(name: 'price') required double price}) = _$_ShopItem;

  factory _ShopItem.fromJson(Map<String, dynamic> json) = _$_ShopItem.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'amount')
  int get amount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'price')
  double get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ShopItemCopyWith<_$_ShopItem> get copyWith =>
      throw _privateConstructorUsedError;
}
