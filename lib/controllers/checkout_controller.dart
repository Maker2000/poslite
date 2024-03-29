import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/util/general_extensions.dart';
import '../../models/shop_item/shop_item.dart';
import '../util/magic_strings.dart';

class CheckoutController extends Notifier<List<ShopItem>> {
  void addToCheckout(ShopItem item) {
    int index = state.indexOf(item);
    if (index > -1) {
      state[index].amount++;
      state[index] = state[index].copyWith();
    } else {
      state = [...state, item];
    }
  }

  int changeCheckoutItemCount(ShopItem item, ItemCountChangeType changeType) {
    int index = state.indexWhere((element) => element.id == item.id);
    if (index > -1) {
      var s = state[index];
      changeType == ItemCountChangeType.add ? s.amount++ : s.amount--;
      state = state.map((e) => e.id == s.id ? s.copyWith() : e).toList();
      return state[index].amount;
    } else {
      return 0;
    }
  }

  void removeCheckoutItem(ShopItem item) {
    state = [...state.where((element) => element.id != item.id)];
  }

  List<ShopItem> buildItems(List<ShopItem> itemsFromDb) {
    List<ShopItem> itemsToReturn = [];
    for (var item in state) {
      try {
        var dbItem = itemsFromDb.firstWhere((element) => element.id == item.id);
        itemsToReturn.add(dbItem.copyWith(amount: item.amount));
      } catch (e) {
        //   state.remove(item);
      }
    }
    return itemsToReturn;
  }

  double get totalPrice => state.sum((x) => x.totalCost).toDouble();

  @override
  List<ShopItem> build() {
    state = [
      ShopItem(amount: 2, price: 543, name: "Yam", barcodeId: '1'),
      ShopItem(amount: 3, price: 120, name: "Peas", barcodeId: '2'),
      ShopItem(amount: 1, price: 543, name: "Bread", barcodeId: '3'),
      ShopItem(amount: 1, price: 243, name: "Toothpaste", barcodeId: '4'),
      ShopItem(amount: 4, price: 1043, name: "Cake", barcodeId: '5')
    ];
    return state;
  }
}
