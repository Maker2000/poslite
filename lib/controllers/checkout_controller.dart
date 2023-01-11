import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/shop_item/shop_item.dart';

class CheckoutController extends AutoDisposeNotifier<List<ShopItem>> {
  void addToCheckout(ShopItem item) {
    int index = state.indexOf(item);
    if (index > -1) {
      state[index].amount++;
      state[index] = state[index].copyWith();
    } else {
      state = [...state, item];
    }
  }

  double get totalPrice {
    double total = 0;

    for (var item in state) {
      total += (item.amount * item.price);
    }
    return total;
  }

  @override
  List<ShopItem> build() {
    state = [
      ShopItem(amount: 2, price: 543, name: "Yam"),
      ShopItem(amount: 3, price: 120, name: "Peas"),
      ShopItem(amount: 1, price: 543, name: "Bread")
    ];
    return state;
  }
}
