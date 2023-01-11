import 'package:flutter/material.dart';
import 'package:poslite/util/general_extensions.dart';
import 'package:poslite/util/poslite_colors.dart';

class POSLiteTheme {
  static ThemeData appTheme(Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      primaryColor: brightness.isDark ? Colors.black : Colors.white,
      scaffoldBackgroundColor: PosLiteColors.canvasColor(brightness),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: brightness.isDark ? Colors.black : Colors.white,
        selectedIconTheme: const IconThemeData(
          color: Colors.yellow,
        ),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF8D260),
        ),
      ),
      // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface)
    );
  }
}
