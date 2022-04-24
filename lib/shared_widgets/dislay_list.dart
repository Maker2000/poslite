import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayList extends StatelessWidget {
  final List<QueryDocumentSnapshot<Object>> documents;
  final Widget Function(BuildContext, Object?) item;
  const DisplayList({Key? key, required this.documents, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => item(context, documents[index].data()),
    );
  }
}
