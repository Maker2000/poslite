import 'package:flutter/material.dart';
import '../pages/pages.dart';
import 'magic_strings.dart';

class Routes {
  static Map<String, WidgetBuilder> normalRoutes = {
    RouteName.dashboard.name: (context) => const Dashboard(),
    RouteName.inventory.name: (context) => const Inventory(),
    RouteName.addItems.name: (context) => const AddItems(),
    RouteName.login.name: (context) => const Login(),
    RouteName.home.name: (context) => const Home()
  };
  static Route<dynamic> generatedRoutes(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (context) => const Dashboard());
    }
  }
}
