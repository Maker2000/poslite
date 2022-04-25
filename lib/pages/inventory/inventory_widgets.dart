import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poslite/models/shop_item.dart';
import 'package:poslite/repositories/item_repo.dart';
import 'package:poslite/shared_widgets/validate_formfield.dart';

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
            DataCell(Text(item.data().name)),
            DataCell(Text('${item.data().price}')),
            DataCell(Text('${item.data().amount}')),
            DataCell(IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => InventoryItemEditAlert(item: item));
                },
                icon: const Icon(Icons.edit))),
          ])
      ],
    );
  }
}

class InventoryItemEditAlert extends StatefulWidget {
  final QueryDocumentSnapshot<ShopItem> item;
  const InventoryItemEditAlert({Key? key, required this.item})
      : super(key: key);

  @override
  State<InventoryItemEditAlert> createState() => _InventoryItemEditAlertState();
}

class _InventoryItemEditAlertState extends State<InventoryItemEditAlert> {
  late ShopItem _item;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _item = widget.item.data();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit ${widget.item.data().name}'),
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
            await ProductRepository.instance.updateItem(_item, widget.item.id);
            Navigator.pop(context);
          },
          child: const Text('Confirm'),
        ),
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
