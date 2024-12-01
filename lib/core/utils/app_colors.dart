import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xff000DFF);
  static const Color secondaryBlue = Color(0xff6B73FF);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primaryBlue,
      secondaryBlue,
    ],
  );

  static const Color white = Color(0xffFFFFFF);
}
