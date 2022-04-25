import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ValidateFormField<T> extends StatelessWidget {
  T data;
  final Function(String) onChange;
  ValidateFormField({Key? key, required this.data, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: data.toString(),
      validator: (d) {
        if (d!.isEmpty) return "* required";
        return null;
      },
      onChanged: onChange,
    );
  }
}
