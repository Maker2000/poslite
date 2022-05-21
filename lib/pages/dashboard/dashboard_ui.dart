// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dashboard_widgets.dart';
import '../../shared_widgets/item_card.dart';
import '../../util/magic_strings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

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
                  crossAxisCount: 1,
                  children: const [SalesGraph()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
