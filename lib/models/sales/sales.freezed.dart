// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sales.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sales _$SalesFromJson(Map<String, dynamic> json) {
  return _Sales.fromJson(json);
}

/// @nodoc
mixin _$Sales {
  @JsonKey(name: 'items')
  @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
  List<ShopItem> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
  set items(List<ShopItem> value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  @TimestampConverter()
  Timestamp get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  @TimestampConverter()
  set date(Timestamp value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesCopyWith<Sales> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesCopyWith<$Res> {
  factory $SalesCopyWith(Sales value, $Res Function(Sales) then) =
      _$SalesCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'items')
      @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
          List<ShopItem> items,
      @JsonKey(name: 'date')
      @TimestampConverter()
          Timestamp date});
}

/// @nodoc
class _$SalesCopyWithImpl<$Res> implements $SalesCopyWith<$Res> {
  _$SalesCopyWithImpl(this._value, this._then);

  final Sales _value;
  // ignore: unused_field
  final $Res Function(Sales) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShopItem>,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
abstract class _$$_SalesCopyWith<$Res> implements $SalesCopyWith<$Res> {
  factory _$$_SalesCopyWith(_$_Sales value, $Res Function(_$_Sales) then) =
      __$$_SalesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'items')
      @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
          List<ShopItem> items,
      @JsonKey(name: 'date')
      @TimestampConverter()
          Timestamp date});
}

/// @nodoc
class __$$_SalesCopyWithImpl<$Res> extends _$SalesCopyWithImpl<$Res>
    implements _$$_SalesCopyWith<$Res> {
  __$$_SalesCopyWithImpl(_$_Sales _value, $Res Function(_$_Sales) _then)
      : super(_value, (v) => _then(v as _$_Sales));

  @override
  _$_Sales get _value => super._value as _$_Sales;

  @override
  $Res call({
    Object? items = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_Sales(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShopItem>,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sales implements _Sales {
  _$_Sales(
      {@JsonKey(name: 'items')
      @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
          required this.items,
      @JsonKey(name: 'date')
      @TimestampConverter()
          required this.date});

  factory _$_Sales.fromJson(Map<String, dynamic> json) =>
      _$$_SalesFromJson(json);

  @override
  @JsonKey(name: 'items')
  @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
  List<ShopItem> items;
  @override
  @JsonKey(name: 'date')
  @TimestampConverter()
  Timestamp date;

  @override
  String toString() {
    return 'Sales(items: $items, date: $date)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SalesCopyWith<_$_Sales> get copyWith =>
      __$$_SalesCopyWithImpl<_$_Sales>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalesToJson(this);
  }
}

abstract class _Sales implements Sales {
  factory _Sales(
      {@JsonKey(name: 'items')
      @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
          required List<ShopItem> items,
      @JsonKey(name: 'date')
      @TimestampConverter()
          required Timestamp date}) = _$_Sales;

  factory _Sales.fromJson(Map<String, dynamic> json) = _$_Sales.fromJson;

  @override
  @JsonKey(name: 'items')
  @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
  List<ShopItem> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'date')
  @TimestampConverter()
  Timestamp get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SalesCopyWith<_$_Sales> get copyWith =>
      throw _privateConstructorUsedError;
}
