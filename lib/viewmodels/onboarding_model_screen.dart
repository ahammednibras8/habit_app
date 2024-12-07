import 'package:flutter/material.dart';
import 'package:mindful_habit_builder_app/core/utils/app_colors.dart';

class OnboardingModelScreen extends StatelessWidget {
  final List<Widget> children;
  const OnboardingModelScreen({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.blueGradient,
            ),
          ),

          // Circle Ring
          Center(
            child: Image.asset(
              'assets/vectors/circle-ring.png',
              width: 475,
              height: 475,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
