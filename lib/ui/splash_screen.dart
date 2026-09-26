import 'dart:async';

import 'package:flutter/material.dart';

import '../core/resources/routes_manager.dart';
import 'intro_screen/share_preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      // تأخير لمدة 3 ثواني ثم التحقق من الـ SharedPreferences
      bool seenIntro = await SharePreference.hasSeenIntro();
      if (!mounted) return;
      if (seenIntro) {
        Navigator.pushReplacementNamed(
          context,
          RoutesManager.homeRouteName,
        ); // لو شاف الـ Intro قبل كده، روح للـ Home علطول
      } else {
        Navigator.pushReplacementNamed(
          context,
          RoutesManager.introScreenRouteName,
        ); // لو أول مرة، روح للـ Intro
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Image.asset(
              'assets/images/icon_splash.png',
              width: 343,
              height: 343,
            ),
          ),
          SizedBox(height: 150),
          Image.asset('assets/images/route_logo.png', width: 180),
          SizedBox(height: 10),
          Text(
            'Supervised by Mohamed Nabil',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFFDAB98D),
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
