import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/providers/providers.dart';
import 'package:poslite/providers/theme_handler.dart';
import 'package:poslite/util/general_extensions.dart';
import 'package:poslite/util/pos_lite_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'util/magic_strings.dart';
import 'util/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var pref = await SharedPreferences.getInstance();
  // var userDataString = pref.getString(SharedPreferenceName.userData.name);
  ThemeMode themeMode = ThemeMode.values
          .byNameOrNull(pref.getString(SharedPreferenceName.themeMode.name)) ??
      ThemeMode.system;
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWith((ref) => pref),
        themeHandlerProvider.overrideWith(() => ThemeHandler(themeMode))
      ],
      child: const POSLite(),
    ),
  );
}

class POSLite extends ConsumerWidget {
  const POSLite({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var router = ref.read(routeProvider);
    return MaterialApp.router(
      themeMode: ref.watch(themeHandlerProvider),
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      title: 'POS Lite',
      theme: POSLiteTheme.appTheme(Brightness.light),
      darkTheme: POSLiteTheme.appTheme(Brightness.dark),
    );
  }
}
