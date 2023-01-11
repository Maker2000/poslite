import 'package:flutter/material.dart';
import 'package:poslite/util/general_extensions.dart';

class PosLiteColors {
  static Color canvasColor(Brightness brightness) =>
      brightness.isLight ? const Color(0xFFF1F4F8) : const Color(0XFF141414);
}
