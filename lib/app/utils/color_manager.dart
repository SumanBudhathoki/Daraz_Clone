import 'package:flutter/material.dart';

class ColorManager {
  static Color primaryWhite = HexColor.fromHex('#FFFFFF');
  static Color primaryOrange = HexColor.fromHex('#f85606');
  static Color primaryGrey = HexColor.fromHex('#9e9e9e');
  static Color primaryCyan = HexColor.fromHex('#C2FFFA');
  static Color secondaryGrey = HexColor.fromHex('#757575');
  static Color primaryBlack = HexColor.fromHex('#000000');
  static Color secondaryBlack = HexColor.fromHex('#1a1a1a');
}

extension HexColor on Color {
  static Color fromHex(String hexColorCode) {
    hexColorCode = hexColorCode.replaceAll('#', '');
    if (hexColorCode.length == 6) {
      hexColorCode = "FF$hexColorCode"; //8 Char with opacity 100%
    }
    return Color(int.parse(hexColorCode,
        radix: 16)); //converting hexcolorcode string to int
  }
}
