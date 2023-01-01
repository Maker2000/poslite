import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import '../../models/shop_item/shop_item.dart';
import '../../providers/providers.dart';
import '../../shared_widgets/barcode_scanner.dart';
import '../../shared_widgets/item_card.dart';
import '../../shared_widgets/loading_screen.dart';

class AddItems extends ConsumerStatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddItemsState();
}

class _AddItemsState extends ConsumerState<AddItems> {
  bool isScanning = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ref.watch(addItemProvider).isLoading
            ? const LoadingScreen()
            : Column(
                children: [
                  Flexible(
                    flex: 6,
                    child: ListView.builder(
                      itemCount: ref.watch(addItemProvider).value!.items.length,
                      itemBuilder: (context, index) {
                        ShopItem item =
                            ref.watch(addItemProvider).value!.items[index];
                        return ItemCard(
                          item: item,
                          onDelete: (id) {
                            ref
                                .read(addItemProvider.notifier)
                                .deleteFromList(id);
                          },
                          onEdit: (id) {},
                          label: 'add to inventory list.',
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await ref
                          .read(addItemProvider.notifier)
                          .addItemToDatabase();
                    },
                    child: const Text('Submit'),
                  ),
                  SizedBox(
                    height: 60,
                    child: BarcodeWidget(onTap: (value) async {
                      await ref
                          .read(addItemProvider.notifier)
                          .addItem(value, context);
                    }),
                  ),
                ],
              ));
  }
}
