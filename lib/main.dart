import 'package:flutter/material.dart';
import 'package:mindful_habit_builder_app/views/auth/gender_selection_screen.dart';
import 'package:mindful_habit_builder_app/views/onboarding/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GenderSelectionScreen(),
    );
  }
}
