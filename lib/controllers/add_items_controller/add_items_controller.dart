import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../repositories/item_repo.dart';

import '../../../models/shop_item/shop_item.dart';
import '../../../shared_widgets/inventory_item_edit.dart';

part 'add_items_state.dart';
part 'add_items_controller.freezed.dart';

class AddItemController extends AutoDisposeAsyncNotifier<AddItemsState> {
  late List<ShopItem> databaseList;
  void deleteFromList(String id) {
    state = AsyncValue.data(state.value!.copyWith(
        items:
            state.value!.items.where((element) => element.id != id).toList()));
  }

  void editInList(String id) {
    // state = state.where((element) => element.id != id).toList();
  }

  Future<void> addItem(String id, BuildContext context) async {
    int itemFromDatabase = databaseList.indexWhere(
      (element) => element.barcodeId == id,
    );
    int hasItem = state.value!.items.indexWhere(
      (element) => element.barcodeId == id,
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
                item: ShopItem.empty().copyWith(barcodeId: id),
              );
            });
      }
      if (obj != null) {
        state = AsyncValue.data(
            state.value!.copyWith(items: [...state.value!.items, obj]));
      }
    } else {
      state = AsyncValue.data(state.value!.copyWith(items: [
        for (var item in state.value!.items)
          if (item.barcodeId == id)
            item.copyWith(amount: item.amount + 1)
          else
            item
      ]));
    }
  }

  Future<void> init() async {
    state = const AsyncValue.loading();

    // databaseList = (await ProductRepository.instance.getAllItems.get())
    //     .docs
    //     .map<ShopItem>((e) => e.data())
    //     .toList();

    state = AsyncValue.data(state.value!);
  }

  Future<String> addItemToDatabase() async {
    String message = '';
    try {
      for (var item in state.value!.items) {
        await ProductRepository.instance.addItem(item, item.barcodeId);
      }
      message = "Items added successfully";
    } on SocketException {
      message = 'No internet connection';
    } catch (e) {
      message = 'An error has occured';
    }
    return message;
  }

  @override
  FutureOr<AddItemsState> build() {
    return state.value!;
  }
}
