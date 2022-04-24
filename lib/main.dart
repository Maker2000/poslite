import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poslite/models/shop_item.dart';
import 'package:poslite/shared_widgets/dislay_list.dart';
import 'package:poslite/shared_widgets/loading_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('test'),
        ),
        body: StreamBuilder<QuerySnapshot<ShopItem>>(
          builder: (context, snapshot) {
            print(snapshot.connectionState);
            return !snapshot.hasData
                ? const LoadingScreen()
                : DisplayList(
                    documents: snapshot.data!.docs,
                    item: (context, data) {
                      ShopItem item = data as ShopItem;
                      return Text(item.name);
                    });
          },
        ) /* BarcodeCamera(
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
      ), */
        );
  }
}
