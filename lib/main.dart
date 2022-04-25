import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poslite/util/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const POSLite());
}

class POSLite extends StatelessWidget {
  const POSLite({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS Lite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteNames.dashboard,
      routes: Routes.normalRoutes,
      onGenerateRoute: Routes.generatedRoutes,
    );
  }
}
