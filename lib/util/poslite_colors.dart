import 'package:flutter/material.dart';
import 'general_extensions.dart';

class PosLiteColors {
  static Color canvasColor(Brightness brightness) =>
      brightness.isLight ? const Color(0xFFF1F4F8) : const Color(0XFF141414);
  static Color yellow = const Color(0XFFFFCC00);
  static Color primary(Brightness brightness) =>
      brightness.isLight ? Colors.white : Colors.black;
  static Color textColor(Brightness brightness) =>
      brightness.isDark ? Colors.white : Colors.black;
}
