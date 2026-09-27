import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import '../home/screen/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: _introKey,
      globalBackgroundColor: ColorsManager.blackColor,
      pages: [
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          decoration: PageDecoration(
            pageColor: ColorsManager.blackColor,
            contentMargin: EdgeInsets.zero,
          ),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/img_header.png',
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/intro_images/Group.png',
                height: 280,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 100),
              Text(
                "Welcome To Islami App",
                style: TextStyle(
                  color: ColorsManager.goldColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          decoration: PageDecoration(
            pageColor: ColorsManager.blackColor,
            contentMargin: EdgeInsets.zero,
          ),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/img_header.png',
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/intro_images/kaaba.png',
                height: 280,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              Text(
                "Welcome To Islami",
                style: TextStyle(
                  color: ColorsManager.goldColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "We Are Very Excited To Have You In Our Community",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsManager.goldColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          decoration: PageDecoration(
            pageColor: ColorsManager.blackColor,
            contentMargin: EdgeInsets.zero,
          ),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/img_header.png',
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/intro_images/quran.png',
                height: 280,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              Text(
                "Reading the Quran",
                style: TextStyle(
                  color: ColorsManager.goldColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Read, and your Lord is the Most Generous",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsManager.goldColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          decoration: PageDecoration(
            pageColor: ColorsManager.blackColor,
            contentMargin: EdgeInsets.zero,
          ),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/img_header.png',
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/intro_images/sebhapng.png',
                height: 280,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              Text(
                "Bearish",
                style: TextStyle(
                  color: ColorsManager.goldColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Praise the name of your Lord, the Most High",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsManager.goldColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          decoration: PageDecoration(
            pageColor: ColorsManager.blackColor,
            contentMargin: EdgeInsets.zero,
          ),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/img_header.png',
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/intro_images/micpng.png',
                height: 280,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              Text(
                "Holy Quran Radio",
                style: TextStyle(
                  color: ColorsManager.goldColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "You can listen to the Holy Quran Radio through the application for free and easily",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsManager.goldColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      showBackButton: true,
      back: Text(
        "Back",
        style: TextStyle(
          color: ColorsManager.goldColor,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      showNextButton: true,
      next: Text(
        "Next",
        style: TextStyle(
          color: ColorsManager.goldColor,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      showDoneButton: true,
      done: Text(
        "Finish",
        style: TextStyle(
          color: ColorsManager.goldColor,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      dotsDecorator: DotsDecorator(
        activeColor: ColorsManager.goldColor,
        color: ColorsManager.greyColor,
        activeSize: const Size(20.0, 8.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
