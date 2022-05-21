// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreTransaction _$StoreTransactionFromJson(Map<String, dynamic> json) {
  return _StoreTransaction.fromJson(json);
}

/// @nodoc
mixin _$StoreTransaction {
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
  @JsonKey(name: 'transactionType')
  String get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionType')
  set transactionType(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreTransactionCopyWith<StoreTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreTransactionCopyWith<$Res> {
  factory $StoreTransactionCopyWith(
          StoreTransaction value, $Res Function(StoreTransaction) then) =
      _$StoreTransactionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'items')
      @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
          List<ShopItem> items,
      @JsonKey(name: 'date')
      @TimestampConverter()
          Timestamp date,
      @JsonKey(name: 'transactionType')
          String transactionType});
}

/// @nodoc
class _$StoreTransactionCopyWithImpl<$Res>
    implements $StoreTransactionCopyWith<$Res> {
  _$StoreTransactionCopyWithImpl(this._value, this._then);

  final StoreTransaction _value;
  // ignore: unused_field
  final $Res Function(StoreTransaction) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? date = freezed,
    Object? transactionType = freezed,
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
      transactionType: transactionType == freezed
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_StoreTransactionCopyWith<$Res>
    implements $StoreTransactionCopyWith<$Res> {
  factory _$$_StoreTransactionCopyWith(
          _$_StoreTransaction value, $Res Function(_$_StoreTransaction) then) =
      __$$_StoreTransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'items')
      @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
          List<ShopItem> items,
      @JsonKey(name: 'date')
      @TimestampConverter()
          Timestamp date,
      @JsonKey(name: 'transactionType')
          String transactionType});
}

/// @nodoc
class __$$_StoreTransactionCopyWithImpl<$Res>
    extends _$StoreTransactionCopyWithImpl<$Res>
    implements _$$_StoreTransactionCopyWith<$Res> {
  __$$_StoreTransactionCopyWithImpl(
      _$_StoreTransaction _value, $Res Function(_$_StoreTransaction) _then)
      : super(_value, (v) => _then(v as _$_StoreTransaction));

  @override
  _$_StoreTransaction get _value => super._value as _$_StoreTransaction;

  @override
  $Res call({
    Object? items = freezed,
    Object? date = freezed,
    Object? transactionType = freezed,
  }) {
    return _then(_$_StoreTransaction(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShopItem>,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      transactionType: transactionType == freezed
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreTransaction implements _StoreTransaction {
  _$_StoreTransaction(
      {@JsonKey(name: 'items')
      @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
          required this.items,
      @JsonKey(name: 'date')
      @TimestampConverter()
          required this.date,
      @JsonKey(name: 'transactionType')
          required this.transactionType});

  factory _$_StoreTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_StoreTransactionFromJson(json);

  @override
  @JsonKey(name: 'items')
  @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
  List<ShopItem> items;
  @override
  @JsonKey(name: 'date')
  @TimestampConverter()
  Timestamp date;
  @override
  @JsonKey(name: 'transactionType')
  String transactionType;

  @override
  String toString() {
    return 'StoreTransaction(items: $items, date: $date, transactionType: $transactionType)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_StoreTransactionCopyWith<_$_StoreTransaction> get copyWith =>
      __$$_StoreTransactionCopyWithImpl<_$_StoreTransaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreTransactionToJson(this);
  }
}

abstract class _StoreTransaction implements StoreTransaction {
  factory _StoreTransaction(
      {@JsonKey(name: 'items')
      @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
          required List<ShopItem> items,
      @JsonKey(name: 'date')
      @TimestampConverter()
          required Timestamp date,
      @JsonKey(name: 'transactionType')
          required String transactionType}) = _$_StoreTransaction;

  factory _StoreTransaction.fromJson(Map<String, dynamic> json) =
      _$_StoreTransaction.fromJson;

  @override
  @JsonKey(name: 'items')
  @ObjectListConverter<ShopItem>(ShopItem.fromJson, ShopItem.tojson)
  List<ShopItem> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'date')
  @TimestampConverter()
  Timestamp get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'transactionType')
  String get transactionType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StoreTransactionCopyWith<_$_StoreTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
