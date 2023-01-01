import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'util/magic_strings.dart';
import 'util/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var pref = await SharedPreferences.getInstance();
  var userData = runApp(const ProviderScope(child: POSLite()));
}

class POSLite extends ConsumerWidget {
  const POSLite({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'POS Lite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? RouteName.login.name
          : RouteName.home.name,
      routes: Routes.normalRoutes,
      onGenerateRoute: Routes.generatedRoutes,
    );
  }
}
