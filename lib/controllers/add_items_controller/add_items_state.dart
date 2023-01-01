part of 'add_items_controller.dart';

@freezed
class AddItemsState with _$AddItemsState {
  const factory AddItemsState({
    @Default(<ShopItem>[]) List<ShopItem> items,
  }) = _AddItemsState;
}
