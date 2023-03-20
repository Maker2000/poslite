import 'package:flutter/material.dart';

class DisplayList<T> extends StatelessWidget {
  final List<T> documents;
  final Widget Function(BuildContext, T) item;
  const DisplayList({Key? key, required this.documents, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (context, index) => item(context, documents[index]),
    );
  }
}
