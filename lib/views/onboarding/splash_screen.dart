import 'package:flutter/material.dart';
import 'package:mindful_habit_builder_app/core/utils/app_colors.dart';
import 'package:mindful_habit_builder_app/viewmodels/onboarding_model_screen.dart';
import 'package:mindful_habit_builder_app/views/onboarding/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
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
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingModelScreen(
      children: [
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
                        'assets/logo/logo.png',
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
    );
  }
}
