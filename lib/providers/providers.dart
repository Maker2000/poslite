import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/controllers.dart';
import '../models/shop_item/shop_item.dart';

final addItemProvider =
    AutoDisposeAsyncNotifierProvider<AddItemController, AddItemsState>(
        AddItemController.new);

final loginProvider =
    AutoDisposeAsyncNotifierProvider<LoginScreenController, LoginState>(
        LoginScreenController.new);

final checkoutProvider =
    AutoDisposeNotifierProvider<CheckoutController, List<ShopItem>>(
        CheckoutController.new);
final userProvider =
    NotifierProvider<UserController, User?>(UserController.new);
