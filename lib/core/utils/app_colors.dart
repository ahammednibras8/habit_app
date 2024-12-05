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

  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6B73FF), // Top color
      Color(0xFF3C46FF), // Middle color
      Color(0xFF3C46FF), // Middle color
      Color(0xFF000DFF), // Darker blue at bottom
    ],
    stops: [0.0,0.25, 0.5, 1.0],
  );

  static const Color white = Color(0xffFFFFFF);
}
