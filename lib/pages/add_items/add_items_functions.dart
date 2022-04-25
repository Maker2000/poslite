import 'dart:io';

import 'package:poslite/models/shop_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/repositories/item_repo.dart';

final addItemFunction =
    StateNotifierProvider<AddItemFunctions, List<ShopItem>>((ref) {
  return AddItemFunctions([]);
});

class AddItemFunctions extends StateNotifier<List<ShopItem>> {
  AddItemFunctions(List<ShopItem> state) : super(state);
  void addItemToList(ShopItem item) {
    state = [...state, item];
  }

  Future<String> addItemToDatabase() async {
    String message = '';
    try {
      for (var item in state) {
        await ProductRepository.instance.addItem(item);
      }
      message = "Items added successfully";
    } on SocketException {
      message = 'No internet connection';
    } catch (e) {
      message = 'An error has occured';
    }
    return message;
  }
}
