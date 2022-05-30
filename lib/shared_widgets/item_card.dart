import 'package:flutter/material.dart';
import 'package:poslite/models/shop_item/shop_item.dart';
import 'package:poslite/shared_widgets/circle_button.dart';
import 'package:poslite/shared_widgets/inventory_item_edit.dart';

class ItemCard extends StatelessWidget {
  final ShopItem item;
  final void Function(String) onDelete;
  final void Function(ShopItem) onEdit;
  final String label;
  const ItemCard(
      {Key? key,
      required this.item,
      required this.onDelete,
      required this.onEdit,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [Text("${item.name}")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${item.amount} in $label"),
                  Text("\$${item.price}"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleButton(
                    onTap: () async {
                      ShopItem? editedItem = await showItemEditDialog(
                          context: context, item: item);

                      if (editedItem != null) onEdit(editedItem);
                    },
                    iconData: Icons.edit,
                  ),
                  CircleButton(
                    onTap: () {
                      onDelete(item.id!);
                    },
                    iconData: Icons.delete,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
