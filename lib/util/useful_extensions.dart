import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension AsyncValueUI on AsyncValue<String> {
  // isLoading shorthand (AsyncLoading is a subclass of AsycValue)
  bool get isLoading => this is AsyncLoading<String>;
  // show a snackbar on error only
  void showSnackBarOnError(BuildContext context) => whenOrNull(
        data: (data) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(data),
            ),
          );
        },
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                error.toString(),
              ),
            ),
          );
        },
      );
}
