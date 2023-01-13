import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../util/magic_strings.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class Home extends StatefulWidget {
  final Widget child;

  const Home({super.key, required this.child});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // TabBar(tabs: tabs)
          widget.child,
          POSLiteBottomNavBar(
            items: [
              POSLiteNavBarItem(
                icon: const Icon(FontAwesomeIcons.house),
              ),
              POSLiteNavBarItem(
                icon: const Icon(FontAwesomeIcons.cartFlatbed),
              ),
              POSLiteNavBarItem(
                icon: const Icon(FontAwesomeIcons.cartShopping),
              ),
              POSLiteNavBarItem(
                icon: const Icon(FontAwesomeIcons.gears),
              ),
            ],
            onTap: (i) {
              context.goNamed(RouteName.values[i].name);
              setState(() {
                currentIndex = i;
              });
            },
            currentIndex: currentIndex,
          )
        ],
      ),
    );
  }
}
