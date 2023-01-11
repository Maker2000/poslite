import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/providers/providers.dart';
import 'package:poslite/util/magic_strings.dart';

class ThemeHandler extends Notifier<ThemeMode> {
  late ThemeMode currentThemeMode;

  ThemeHandler([ThemeMode? currentThemeMode]) {
    this.currentThemeMode = currentThemeMode ?? ThemeMode.system;
  }
  @override
  ThemeMode build() {
    state = currentThemeMode;
    return state;
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
    ref
        .read(sharedPreferencesProvider)!
        .setString(SharedPreferenceName.themeMode.name, mode.name);
  }
}
