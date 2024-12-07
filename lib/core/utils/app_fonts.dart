import 'package:flutter/material.dart';

class AppFonts {
  static const String family = 'Cereal';

  // Font Weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Text Styles
  //Headline
  static TextStyle get h2Bold => const TextStyle(
        fontFamily: family,
        fontSize: 40,
        fontWeight: bold,
        height: 1.2,
      );

  //Body
  static TextStyle get paragraphMedium => const TextStyle(
        fontFamily: family,
        fontSize: 14,
        fontWeight: medium,
        height: 1.4,
      );
  static TextStyle get alternativeBook => const TextStyle(
        fontFamily: family,
        fontSize: 12,
        fontWeight: regular,
        height: 0.75,
      );
}
