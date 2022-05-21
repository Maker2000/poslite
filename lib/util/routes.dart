import 'package:flutter/material.dart';
import '../pages/add_items/add_items_ui.dart';
import '../pages/dashboard/dashboard_ui.dart';
import '../pages/inventory/inventory_ui.dart';
import '../pages/login/login_ui.dart';
import '../pages/main_home_screen.dart';
import 'magic_strings.dart';

class Routes {
  static Map<String, WidgetBuilder> normalRoutes = {
    RouteNames.dashboard: (context) => const Dashboard(),
    RouteNames.inventory: (context) => const Inventory(),
    RouteNames.addItems: (context) => const AddItems(),
    RouteNames.login: (context) => const Login(),
    RouteNames.home: (context) => const MainHomeScreen()
  };
  static Route<dynamic> generatedRoutes(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (context) => const Dashboard());
    }
  }
}
