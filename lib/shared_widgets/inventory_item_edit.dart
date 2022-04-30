import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poslite/shared_widgets/validate_formfield.dart';

import '../models/shop_item.dart';
import '../pages/add_items/add_items_functions.dart';
import '../repositories/item_repo.dart';

class InventoryItemEditAlert<T> extends StatefulWidget {
  final T item;
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
    setState(() {
      switch (widget.item.runtimeType) {
        case AddItemObj:
          _item = (widget.item as AddItemObj).item;
          break;

        default:
          _item = (widget.item as QueryDocumentSnapshot<ShopItem>).data();
      }
    });
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
            switch (widget.item.runtimeType) {
              case AddItemObj:
                //widget.onClose!.call(AddItemObj((widget.item as AddItemObj).id, _item));
                break;

              default:
                await ProductRepository.instance
                    .updateItem(_item, (widget.item as AddItemObj).id);
            }

            Navigator.pop(context, AddItemObj(widget.item.id, _item));
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
