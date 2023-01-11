import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/providers/theme_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

final sharedPreferencesProvider = Provider<SharedPreferences?>((ref) => null);
final themeHandlerProvider =
    NotifierProvider<ThemeHandler, ThemeMode>(ThemeHandler.new);
