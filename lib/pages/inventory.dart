import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import '../../models/shop_item/shop_item.dart';
import '../../repositories/item_repo.dart';
import '../../shared_widgets/loading_screen.dart';
import '../../util/magic_strings.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
      ),
      // body: StreamBuilder<List<ShopItem>>(
      //   stream: ProductRepository.instance.getAllItems,
      //   builder: (context, snapshot) {
      //     return !snapshot.hasData
      //         ? const LoadingScreen()
      //         : InventoryDataTable(
      //             items: snapshot
      //                 .data!); /* DisplayList<ShopItem>(
      //             documents: snapshot.data!.docs,
      //             item: (context, data) {
      //               item = data;
      //               return Text(data.data().name);
      //             }); */
      //   },
      // ),
      // floatingActionButton: FloatingActionButton.extended(
      //   icon: const Icon(Icons.add),
      //   onPressed: () async {
      //     Navigator.pushNamed(context, RouteName.addItems.name);
      //   },
      //   label: const Text('Add Item'),
      // ),
    );
  }
}
