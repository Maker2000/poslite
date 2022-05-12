import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:poslite/models/shop_item/shop_item.dart';
import 'package:poslite/pages/add_items/add_items_functions.dart';
import 'package:poslite/shared_widgets/inventory_item_edit.dart';
import 'package:poslite/shared_widgets/loading_screen.dart';

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
          : BarcodeCamera(
              types: const [
                BarcodeType.ean8,
                BarcodeType.ean13,
                BarcodeType.code128
              ],
              resolution: Resolution.hd720,
              framerate: Framerate.fps30,
              mode: DetectionMode.pauseVideo,
              onScan: (code) async {
                // ignore: avoid_print
                print(code.value);

                setState(() {
                  isScanning = false;
                });
                AddItemObj? obj = await showDialog<AddItemObj>(
                    context: context,
                    builder: (_) {
                      return InventoryItemEditAlert<AddItemObj>(
                        item: AddItemObj(code.value, ShopItem.empty()),
                      );
                    });
                if (obj != null) {
                  ref.read(addItemFunction.notifier).addItemToList(obj);
                  // ref.read(addItemFunction.notifier).addItemToDatabase();
                }
                CameraController.instance.resumeDetector();
                setState(() {
                  isScanning = true;
                });
              },
              children: const [
                MaterialPreviewOverlay(animateDetection: false),
                BlurPreviewOverlay(),
              ],
            ),
    );
  }
}
