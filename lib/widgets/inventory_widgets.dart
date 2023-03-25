import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/shop_item/shop_item.dart';
import '../../repositories/item_repo.dart';
import '../../shared_widgets/item_card.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var item in items)
            ItemCard(
              item: item.data(),
              onDelete: (id) {
                ProductRepository.instance.deleteItem(id);
              },
              onEdit: (id) {
                ProductRepository.instance.updateItem(id, id.id!);
              },
              label: 'inventory',
            )
        ],
      ),
    );
  }
}
