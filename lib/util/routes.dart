import 'package:flutter/material.dart';
import 'package:poslite/pages/add_items/add_items_ui.dart';
import 'package:poslite/pages/dashboard/dashboard_ui.dart';
import 'package:poslite/pages/inventory/inventory_ui.dart';

class Routes {
  static Map<String, WidgetBuilder> normalRoutes = {
    RouteNames.dashboard: (context) => const Dashboard(),
    RouteNames.inventory: (context) => const Inventory(),
    RouteNames.addItems: (context) => const AddItems()
  };
  static Route<dynamic> generatedRoutes(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (context) => const Dashboard());
    }
  }
}

class RouteNames {
  static const String dashboard = 'dashboard',
      inventory = 'inventory',
      addItems = 'addItems';
}
