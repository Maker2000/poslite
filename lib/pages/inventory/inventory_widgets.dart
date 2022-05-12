import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poslite/models/shop_item/shop_item.dart';

import '../../shared_widgets/inventory_item_edit.dart';

class InventoryItem extends StatelessWidget {
  final ShopItem item;
  const InventoryItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class InventoryDataTable extends StatelessWidget {
  final List<QueryDocumentSnapshot<ShopItem>> items;
  const InventoryDataTable({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Amount')),
        DataColumn(label: SizedBox.shrink()),
      ],
      rows: [
        for (var item in items)
          DataRow(cells: [
            DataCell(Text(item.data().name!)),
            DataCell(Text('${item.data().price}')),
            DataCell(Text('${item.data().amount}')),
            DataCell(IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => InventoryItemEditAlert(
                            item: item,
                          ));
                },
                icon: const Icon(Icons.edit))),
          ])
      ],
    );
  }
}
