import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'validate_formfield.dart';

import '../models/shop_item/shop_item.dart';

Future<ShopItem?> showItemEditDialog(
        {required BuildContext context, required ShopItem item}) async =>
    await showDialog<ShopItem>(
        context: context,
        builder: (context) => InventoryItemEditAlert(
              item: item,
            ));

class InventoryItemEditAlert extends StatefulWidget {
  final ShopItem item;
  const InventoryItemEditAlert({Key? key, required this.item})
      : super(key: key);

  @override
  State<InventoryItemEditAlert> createState() => _InventoryItemEditAlertState();
}

class _InventoryItemEditAlertState extends State<InventoryItemEditAlert> {
  late ShopItem _item;
  @override
  void initState() {
    super.initState();
    _item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: !(widget.item.runtimeType == QueryDocumentSnapshot<ShopItem>)
          ? const Text('Add Item')
          : Text(
              'Edit ${(widget.item as QueryDocumentSnapshot<ShopItem>).data().name}'),
      content: Form(
        onChanged: () {
          Form.of(primaryFocus!.context!)!.save();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValidateFormField(
              data: _item.name,
              onChange: (data) => _item.name = data,
            ),
            ValidateFormField(
              data: _item.price,
              onChange: (data) => _item.price = double.parse(data),
            ),
            ValidateFormField(
              data: _item.amount,
              onChange: (data) => _item.amount = int.parse(data),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            Navigator.pop(context, _item);
          },
          child: const Text('Confirm'),
        ),
        if ((widget.item.runtimeType == ShopItem))
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
            ),
          ),
      ],
    );
  }
}
