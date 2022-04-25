import 'package:flutter/material.dart';
import 'package:poslite/shared_widgets/item_card.dart';
import 'package:poslite/util/routes.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Dashboard',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    const ItemCard(
                      iconData: Icons.attach_money,
                      label: 'Checkout',
                    ),
                    ItemCard(
                      iconData: Icons.inventory,
                      label: 'Inventory',
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.inventory);
                      },
                    ),
                    const ItemCard(
                        iconData: Icons.dashboard, label: 'Analytics'),
                    const ItemCard(iconData: Icons.settings, label: 'Settings'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
