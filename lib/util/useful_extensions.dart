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
