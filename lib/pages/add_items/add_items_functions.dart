import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/repositories/item_repo.dart';

import '../../models/shop_item/shop_item.dart';

final addItemFunction =
    StateNotifierProvider<AddItemFunctions, List<AddItemObj>>((ref) {
  return AddItemFunctions([]);
});

class AddItemFunctions extends StateNotifier<List<AddItemObj>> {
  AddItemFunctions(List<AddItemObj> state) : super(state);
  void addItemToList(AddItemObj item) {
    state = [...state, item];
  }

  bool isLoading = false;
  Future<void> init(Function update) async {
    isLoading = true;
    update.call();
    await Future.delayed(const Duration(seconds: 3));
    update.call();
    isLoading = false;
  }

  Future<String> addItemToDatabase() async {
    String message = '';
    //print(state.length);
    try {
      for (var item in state) {
        await ProductRepository.instance.addItem(item.item, item.id);
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

class AddItemObj {
  ShopItem item;
  String id;
  AddItemObj(this.id, this.item);
}
