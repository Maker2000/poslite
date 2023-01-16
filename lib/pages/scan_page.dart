import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/models/shop_item/shop_item.dart';

Future<T?> showScanItemsPage<T>(
        {required BuildContext context,
        required Future<void> Function() onScan}) =>
    showModalBottomSheet(
      constraints: const BoxConstraints(),
      context: context,
      builder: (context) => ScanItemsPage(onScan),
      useRootNavigator: true,
    );

class ScanItemsPage extends ConsumerStatefulWidget {
  final Future<void> Function() onScan;
  const ScanItemsPage(this.onScan, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanItemsPageState();
}

class _ScanItemsPageState extends ConsumerState<ScanItemsPage> {
  bool isScanning = true;
  List<ShopItem> itemsToReturn = [];
  @override
  void initState() {
    super.initState();
    CameraController.instance.pauseDetector();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: BarcodeCamera(
        types: const [BarcodeType.ean8, BarcodeType.ean13, BarcodeType.code128],
        resolution: Resolution.hd720,
        framerate: Framerate.fps30,
        mode: DetectionMode.pauseVideo,
        onScan: (code) async {
          setState(() {
            isScanning = false;
          });
          await widget.onScan();
          CameraController.instance.resumeDetector();
          setState(() {
            isScanning = true;
          });
        },
        children: [
          // const MaterialPreviewOverlay(animateDetection: false),
          // if (CameraController.instance.state.eventNotifier.value ==
          //     CameraEvent.resumed)
          //   const BlurPreviewOverlay(),
        ],
      ),
    );
  }
}
