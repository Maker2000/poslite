import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poslite/models/shop_item/shop_item.dart';
import 'package:poslite/shared_widgets/item_card.dart';
import 'package:poslite/util/routes.dart';

import '../../models/sales/sales.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Sales sale;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sale = Sales(
        items: [ShopItem(amount: 1, price: 2.3, name: 'Hello')],
        date: Timestamp.now());
  }

  @override
  Widget build(BuildContext context) {
    print(sale.toJson());
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
