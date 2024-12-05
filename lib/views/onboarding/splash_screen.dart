import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mindful_habit_builder_app/core/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // ignore: unused_field
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {}
    });
  }

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
          Center(
            child: Image.asset(
              'assets/images/BGs/SplashCircleBG.png',
              width: 475,
              height: 475,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
            ),
          ),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/Logo/logo.png',
                          width: 75,
                          height: 75,
                          filterQuality: FilterQuality.high,
                          isAntiAlias: true,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Routiner',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
