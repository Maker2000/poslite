import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'providers.dart';
import '../util/magic_strings.dart';

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

  static IconData themeIcon(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return FontAwesomeIcons.circleHalfStroke;
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
    }
  }

  IconData get currentThemeModeIcon => themeIcon(state);

  void setThemeMode(ThemeMode mode) {
    state = mode;
    ref
        .read(sharedPreferencesProvider)!
        .setString(SharedPreferenceName.themeMode.name, mode.name);
  }
}
