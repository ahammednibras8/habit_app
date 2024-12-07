import 'package:flutter/material.dart';
import 'package:mindful_habit_builder_app/core/utils/app_colors.dart';
import 'package:mindful_habit_builder_app/core/utils/app_fonts.dart';
import 'package:mindful_habit_builder_app/viewmodels/onboarding_model_screen.dart';
import 'package:mindful_habit_builder_app/views/widgets/my_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _introData = [
    {
      'image': 'assets/vectors/intro-one.png',
      'title': 'Create\nGood Habits',
      'description':
          'Change your life by slowly adding new healthy habits and sticking to them.',
    },
    {
      'image': 'assets/vectors/intro-two.png',
      'title': 'Track Your\nProgress',
      'description':
          'Everyday you become one step closer to your goals. Don\'t give up!',
    },
    {
      'image': 'assets/vectors/intro-three.png',
      'title': 'Stay Together\nand Strong',
      'description':
          'Find Friends to discuss common topics. Complete challenges together.',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //Sliding Intro
  Widget _buildIntroPage(Map<String, String> data) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            data['image']!,
            fit: BoxFit.contain,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            data['title']!,
            style: AppFonts.h2Bold.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          data['description']!,
          textAlign: TextAlign.left,
          style: AppFonts.paragraphMedium.copyWith(
            color: AppColors.blue20,
          ),
        ),
      ],
    );
  }

  //Tracking Dots
  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        _introData.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? AppColors.white : AppColors.blue60,
          ),
        ),
      ),
    );
  }

  //Auth Button Container for Athentication
  Widget _authButtonContainer() {
    return LayoutBuilder(
      builder: (context, constraints) {
        //Space between buttons:
        final spacing = constraints.maxWidth < 360 ? 6.0 : 8.0;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MyButton(
              height: 52,
              icon: Icons.login_outlined,
              text: 'Continue with E-mail',
              color: AppColors.white,
              textColor: AppColors.primaryBlue,
              fontSize: 14,
              iconSize: 18,
            ),
            SizedBox(height: spacing * 1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: MyButton(
                    height: 36,
                    color: AppColors.white,
                    icon: Icons.apple,
                    text: 'Apple',
                    textColor: AppColors.black100,
                  ),
                ),
                SizedBox(width: spacing),
                const Expanded(
                  child: MyButton(
                    height: 36,
                    color: AppColors.white,
                    icon: Icons.g_mobiledata_rounded,
                    text: 'Google',
                    textColor: AppColors.black100,
                  ),
                ),
                SizedBox(width: spacing),
                const Expanded(
                  child: MyButton(
                    height: 36,
                    color: AppColors.white,
                    icon: Icons.facebook,
                    text: 'Facebook',
                    textColor: AppColors.black100,
                  ),
                ),
              ],
            ),
            SizedBox(height: spacing * 1.5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing * 2),
              child: Text(
                'By continuing, you agree to our Terms of Service and Privacy Policy.',
                textAlign: TextAlign.center,
                style: AppFonts.alternativeBook.copyWith(
                  color: AppColors.blue40,
                  height: 1.3,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingModelScreen(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _introData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _buildIntroPage(_introData[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, top: 32),
                child: _buildDots(),
              ),
              _authButtonContainer(),
            ],
          ),
        ),
      ],
    );
  }
}
