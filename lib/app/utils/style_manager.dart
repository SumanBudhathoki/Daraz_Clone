import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

// Title Text Style
TextStyle getTitleStyle(
    {double fontSize = FontSize.s20, Color color = Colors.black}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeight.w400, color);
}

// TextButton Text Style
TextStyle getTextButtonStyle(
    {double fontSize = FontSize.s12, Color color = Colors.white}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeight.w400, color);
}

// Product Card Title
TextStyle getProductTitleStyle({double fontSize = FontSize.s12}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeight.w400,
      ColorManager.secondaryBlack);
}

// Product Card Sub-title // Normal Text
TextStyle getProductSubtitle({double fontSize = FontSize.s12}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeight.w400,
      ColorManager.primaryGrey);
}
