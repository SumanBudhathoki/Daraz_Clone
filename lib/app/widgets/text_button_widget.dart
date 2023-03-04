import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:daraz_clone_app/app/utils/style_manager.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color? color;
  final double? fontSize;

  const TextButtonWidget(
      {super.key,
      required this.text,
      required this.onPress,
      this.color = Colors.white,
      this.fontSize = 12});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(text,
          style: getTextButtonStyle(
            fontSize: FontSize.s14,
          )
          // TextStyle(color: color, fontSize: fontSize, fontFamily: 'Roboto'),
          ),
    );
  }
}
