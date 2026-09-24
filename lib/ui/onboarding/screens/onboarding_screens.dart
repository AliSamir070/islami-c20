import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../model/onboarding_model.dart';
import '../widget/onboarding_page.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  static const String _onboardingKey = 'onboarding_seen';

  Future<void> _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, true);

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, RoutesManager.homeRouteName);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManager.header,
                  width: screenWidth * 0.7,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 39,),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingModel.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPage(item: onboardingModel[index]);
                  },
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: _currentIndex == 0 ? 0 : 1,
                      child: TextButton(
                        onPressed: _currentIndex == 0
                            ? null
                            : () {
                          _controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          'Back',
                          style: TextStyle(color: ColorsManager.goldColor),
                        ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: onboardingModel.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 7,
                        dotWidth: 7,
                        expansionFactor: 2.5,
                        spacing: 6,
                        activeDotColor: ColorsManager.goldColor,
                        dotColor: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_currentIndex == onboardingModel.length - 1) {
                          _finishOnboarding();
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        _currentIndex == onboardingModel.length - 1 ? 'Finish' : 'Next',
                        style: TextStyle(color: ColorsManager.goldColor),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
