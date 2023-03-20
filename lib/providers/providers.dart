import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/controllers.dart';
import '../models/shop_item/shop_item.dart';
import '../models/user/user.dart';
import 'theme_handler.dart';

final addItemProvider =
    AutoDisposeAsyncNotifierProvider<AddItemController, AddItemsState>(
        AddItemController.new);

final loginProvider =
    AutoDisposeAsyncNotifierProvider<LoginScreenController, LoginState>(
        LoginScreenController.new);

final checkoutProvider = NotifierProvider<CheckoutController, List<ShopItem>>(
    CheckoutController.new);
final userProvider =
    NotifierProvider<UserController, User?>(UserController.new);

final sharedPreferencesProvider = Provider<SharedPreferences?>((ref) => null);
final themeHandlerProvider =
    NotifierProvider<ThemeHandler, ThemeMode>(ThemeHandler.new);
