import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/model/onboarding_model.dart';

import '../../core/resources/routes_manager.dart';
import 'dot_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  List<OnboardingModel> onboardingList = [
    OnboardingModel(
      imagePath: AssetsManager.onBoarding1,
      title: "Welcome To Islami App",
    ),
    OnboardingModel(
      imagePath: AssetsManager.onBoarding2,
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingModel(
      imagePath: AssetsManager.onBoarding3,
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    OnboardingModel(
      imagePath: AssetsManager.onBoarding4,
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    OnboardingModel(
      imagePath: AssetsManager.onBoarding5,
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      currentIndex = _pageController.page!.toInt();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AssetsManager.header, height: size.height * 0.15),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        onboardingList[index].imagePath,
                        height: size.height * 0.45,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        onboardingList[index].title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.goldColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (onboardingList[index].description != null)
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.06,
                            left: size.width * 0.03,
                            right: size.width * 0.03,
                          ),
                          child: Text(
                            onboardingList[index].description!,
                            style: TextStyle(
                              fontSize: 20,
                              color: ColorsManager.goldColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      Spacer(),
                    ],
                  );
                },
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: currentIndex != 0
                          ? () {
                              _pageController.animateToPage(
                                currentIndex - 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.bounceInOut,
                              );
                            }
                          : null,
                      child: Text(
                        currentIndex != 0 ? "Back" : "",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.goldColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentIndex == 4) {
                          Navigator.pushReplacementNamed(
                            context,
                            RoutesManager.homeRouteName,
                          );
                        } else {
                          _pageController.animateToPage(
                            currentIndex + 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceInOut,
                          );
                        }
                      },
                      child: Text(
                        currentIndex != 4 ? "Next" : "Finish",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.goldColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotIndicator(isActive: currentIndex == 0),
                    DotIndicator(isActive: currentIndex == 1),
                    DotIndicator(isActive: currentIndex == 2),
                    DotIndicator(isActive: currentIndex == 3),
                    DotIndicator(isActive: currentIndex == 4),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
