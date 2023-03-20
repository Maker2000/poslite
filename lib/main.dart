import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/repositories/database_connection/database_connection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'util/magic_strings.dart';
import 'util/routes.dart';
import 'providers/providers.dart';
import 'providers/theme_handler.dart';
import 'util/general_extensions.dart';
import 'util/pos_lite_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pref = await SharedPreferences.getInstance();
  // var userDataString = pref.getString(SharedPreferenceName.userData.name);
  ThemeMode themeMode = ThemeMode.values
          .byNameOrNull(pref.getString(SharedPreferenceName.themeMode.name)) ??
      ThemeMode.system;
  await DatabaseConnection.instance.initDatabase();
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
