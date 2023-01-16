import 'package:flutter/material.dart';
import 'poslite_colors.dart';

class POSLiteTheme {
  static ThemeData appTheme(Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      primaryColor: PosLiteColors.primary(brightness),
      scaffoldBackgroundColor: PosLiteColors.canvasColor(brightness),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: PosLiteColors.primary(brightness),
        selectedIconTheme: IconThemeData(
          color: PosLiteColors.yellow,
        ),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: PosLiteColors.yellow,
        ),
      ),
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: PosLiteColors.primary(brightness),
        onPrimary: PosLiteColors.textColor(brightness),
        secondary: PosLiteColors.yellow,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: PosLiteColors.primary(brightness),
        onBackground: PosLiteColors.textColor(brightness),
        surface: PosLiteColors.canvasColor(brightness),
        onSurface: PosLiteColors.textColor(brightness),
      ),
    );
  }
}
