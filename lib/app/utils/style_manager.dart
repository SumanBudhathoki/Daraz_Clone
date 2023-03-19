import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
// TextStyle getTitleStyle(
//     {double fontSize = FontSize.s20, Color color = Colors.black}) {
//   return _getTextStyle(
//       fontSize, FontConstants.fontFamily, FontWeight.w400, color);
// }
TextStyle get getTitleStyle {
  return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      letterSpacing: 1);
}

// TextButton Text Style
TextStyle getTextButtonStyle(
    {double fontSize = 12, Color color = Colors.white}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeight.w400, color);
}

// Product Card Title
TextStyle getProductTitleStyle({double fontSize = 12}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeight.w400,
      ColorManager.secondaryBlack);
}

// Product Card Sub-title // Normal Text
TextStyle getProductSubtitle(
    {double fontSize = 12, Color color = Colors.white}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeight.w400, color);
}

// Login Screen Text
TextStyle getLoginSubtitle({
  double fontSize = 12,
  Color color = Colors.cyan,
}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeight.w300, color);
}
