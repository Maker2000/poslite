import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class ObjectListConverter<T> implements JsonConverter<T, Map<String, dynamic>> {
  const ObjectListConverter(this.fromJ, this.toJ);
  final T Function(Map<String, dynamic>) fromJ;
  final Map<String, dynamic> Function(T) toJ;
  @override
  T fromJson(dynamic json) => fromJ(json);

  @override
  Map<String, dynamic> toJson(T object) => toJ(object);
}

class TimestampConverter implements JsonConverter<Timestamp, Timestamp> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Timestamp json) => json;

  @override
  Timestamp toJson(Timestamp object) => object;
}
