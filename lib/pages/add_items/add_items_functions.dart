import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/repositories/item_repo.dart';

import '../../models/shop_item/shop_item.dart';
import '../../shared_widgets/inventory_item_edit.dart';

final addItemFunction =
    StateNotifierProvider<AddItemFunctions, List<ShopItem>>((ref) {
  return AddItemFunctions();
});

class AddItemFunctions extends StateNotifier<List<ShopItem>> {
  AddItemFunctions() : super([]);
  late List<ShopItem> databaseList;
  void deleteFromList(String id) {
    state = state.where((element) => element.id != id).toList();
  }

  void editInList(String id) {
    state = state.where((element) => element.id != id).toList();
  }

  Future<void> addItem(String id, BuildContext context) async {
    int itemFromDatabase = databaseList.indexWhere(
      (element) => element.id == id,
    );
    int hasItem = state.indexWhere(
      (element) => element.id == id,
    );

    if (hasItem == -1) {
      ShopItem? obj;
      if (itemFromDatabase >= 0) {
        obj = databaseList[itemFromDatabase];
      } else {
        obj = await showDialog<ShopItem>(
            context: context,
            builder: (_) {
              return InventoryItemEditAlert(
                item: ShopItem.empty().copyWith(id: id),
              );
            });
      }
      if (obj != null) {
        state = [...state, obj];
      }
    } else {
      state = [
        for (var item in state)
          if (item.id == id) item.copyWith(amount: item.amount + 1) else item
      ];
    }
  }

  bool isLoading = false;
  Future<void> init(Function update) async {
    isLoading = false;
    update.call();
    databaseList = (await ProductRepository.instance.getAllItems.get())
        .docs
        .map<ShopItem>((e) => e.data())
        .toList();
    update.call();
    isLoading = false;
  }

  Future<String> addItemToDatabase() async {
    String message = '';
    try {
      for (var item in state) {
        await ProductRepository.instance.addItem(item, item.id);
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
