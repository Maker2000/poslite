import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/shop_item/shop_item.dart';
import '../pages/checkout/checkout_controller.dart';
import '../pages/login/login_controller.dart';
import '../repositories/auth_repo.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
final loginScreenControllerProvider = StateNotifierProvider.autoDispose<
    LoginScreenController, AsyncValue<String>>((ref) {
  return LoginScreenController(ref.watch(authRepositoryProvider));
});

final checkoutProvider =
    StateNotifierProvider.autoDispose<CheckoutController, List<ShopItem>>(
        (ref) {
  return CheckoutController();
});
