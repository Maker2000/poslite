import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import 'package:flutter/material.dart';

class BarcodeWidget extends StatefulWidget {
  final Future<void> Function(String) onTap;
  final double heightFactor;
  const BarcodeWidget({required this.onTap, this.heightFactor = 0.5, Key? key})
      : super(key: key);

  @override
  State<BarcodeWidget> createState() => _BarcodeWidgetState();
}

class _BarcodeWidgetState extends State<BarcodeWidget> {
  bool isScanning = true;

  @override
  void initState() {
    super.initState();
    CameraController.instance.pauseDetector();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: BarcodeCamera(
            types: const [
              BarcodeType.ean8,
              BarcodeType.ean13,
              BarcodeType.code128
            ],
            resolution: Resolution.hd720,
            framerate: Framerate.fps30,
            mode: DetectionMode.pauseVideo,
            onScan: (code) async {
              setState(() {
                isScanning = false;
              });
              await widget.onTap(code.value);
              CameraController.instance.resumeDetector();
              setState(() {
                isScanning = true;
              });
            },
            children: [
              const MaterialPreviewOverlay(animateDetection: false),
              if (CameraController.instance.state.eventNotifier.value ==
                  CameraEvent.resumed)
                const BlurPreviewOverlay(),
            ],
          ),
        );
      }),
    );
  }
}
