import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

class AddItems extends ConsumerWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BarcodeCamera(
      types: const [BarcodeType.ean8, BarcodeType.ean13, BarcodeType.code128],
      resolution: Resolution.hd720,
      framerate: Framerate.fps30,
      mode: DetectionMode.pauseVideo,
      // ignore: avoid_print
      onScan: (code) => print(code.value),
      children: [
        const MaterialPreviewOverlay(animateDetection: false),
        const BlurPreviewOverlay(),
        Positioned(
          child: ElevatedButton(
            onPressed: () => CameraController.instance.resumeDetector(),
            child: const Text('Resume'),
          ),
        )
      ],
    );
  }
}
