import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'general_extensions.dart';
import '../pages/pages.dart';
import 'magic_strings.dart';

final routeProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: RouteName.dashboard.toRoute, routes: [
    GoRoute(
      path: RouteName.login.toRoute,
      name: RouteName.login.name,
      builder: (context, state) => const Login(),
    ),
    ShellRoute(
      builder: (context, state, child) => Home(child: child),
      routes: [
        GoRoute(
          path: RouteName.dashboard.toRoute,
          name: RouteName.dashboard.name,
          pageBuilder: (context, state) => transitionPage(const Dashboard()),
        ),
        GoRoute(
          path: RouteName.inventory.toRoute,
          name: RouteName.inventory.name,
          pageBuilder: (context, state) => transitionPage(const Inventory()),
        ),
        GoRoute(
          path: RouteName.checkout.toRoute,
          name: RouteName.checkout.name,
          pageBuilder: (context, state) => transitionPage(const CheckOut()),
        ),
        GoRoute(
          path: RouteName.settings.toRoute,
          name: RouteName.settings.name,
          pageBuilder: (context, state) => transitionPage(const AppSettings()),
        ),
      ],
    )
  ]);
});

CustomTransitionPage transitionPage(Widget child) => CustomTransitionPage(
      transitionDuration: const Duration(seconds: 5),
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: const Offset(0.0, -1.0), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      },
    );
