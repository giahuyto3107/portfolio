import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color backgroundColor = Color(0xff14141A);

  static const Color textOnDark = Colors.white;
  static const Color textOnLight = Colors.black;
  static const Color secondaryText = Color(0xffBCB6B6);

  static const LinearGradient horizontalGradientButton = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff3cb5fa),
        Color(0xff1874e3),
      ]
  );

  static const LinearGradient verticalGradientButton = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff3cb5fa),
      Color(0xff1874e3),
    ]
  );

  static const Color disable = Color(0xffa5a5a5);
}