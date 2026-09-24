import 'package:flutter/material.dart';
import 'package:islami_c20/ui/hadeth_details/screen/hadeth_details_screen.dart';
import 'package:islami_c20/ui/home/screen/home_screen.dart';
import 'package:islami_c20/ui/onboarding/screens/onboarding_screens.dart';
import 'package:islami_c20/ui/sura_details/screen/sura_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/resources/routes_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool('onboarding_seen') ?? false;

  runApp(MyApp(seenOnboarding: seenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;
  const MyApp({super.key,required this.seenOnboarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      routes: {
        RoutesManager.homeRouteName:(context)=>HomeScreen(),
        RoutesManager.suraDetailsRouteName:(context)=>SuraDetailsScreen(),
        RoutesManager.hadethDetailRouteName:(context)=>HadethDetailsScreen(),
        RoutesManager.onboardingRouteName: (context) => OnboardingScreens(),
      },
      initialRoute: seenOnboarding
          ? RoutesManager.homeRouteName
          : RoutesManager.onboardingRouteName,
    );
  }
}

