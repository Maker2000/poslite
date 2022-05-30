import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import '../../models/shop_item/shop_item.dart';
import 'add_items_functions.dart';
import '../../shared_widgets/barcode_scanner.dart';
import '../../shared_widgets/item_card.dart';
import '../../shared_widgets/loading_screen.dart';

class AddItems extends ConsumerStatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddItemsState();
}

class _AddItemsState extends ConsumerState<AddItems> {
  @override
  void initState() {
    super.initState();
    ref.read(addItemFunction.notifier).init(() {
      setState(() {});
    });
  }

  bool isScanning = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ref.read(addItemFunction.notifier).isLoading
            ? const LoadingScreen()
            : Column(
                children: [
                  Flexible(
                    flex: 6,
                    child: ListView.builder(
                      itemCount: ref.watch(addItemFunction).length,
                      itemBuilder: (context, index) {
                        ShopItem item = ref.watch(addItemFunction)[index];
                        return ItemCard(
                          item: item,
                          onDelete: (id) {
                            ref
                                .read(addItemFunction.notifier)
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
                          .read(addItemFunction.notifier)
                          .addItemToDatabase();
                    },
                    child: const Text('Submit'),
                  ),
                  SizedBox(
                    height: 60,
                    child: BarcodeWidget(onTap: (value) async {
                      await ref
                          .read(addItemFunction.notifier)
                          .addItem(value, context);
                    }),
                  ),
                ],
              ));
  }
}
