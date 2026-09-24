import 'package:flutter/material.dart';
import 'package:islami_c20/ui/hadeth_details/screen/hadeth_details_screen.dart';
import 'package:islami_c20/ui/home/screen/home_screen.dart';
import 'package:islami_c20/ui/intro/intro_screen.dart';
import 'package:islami_c20/ui/sura_details/screen/sura_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/resources/routes_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final hasSeenOnboarding =
      prefs.getBool("hasSeenOnboarding") ?? false;

  runApp(
    MyApp(
      initialRoute: hasSeenOnboarding
          ? RoutesManager.homeRouteName
          : RoutesManager.introRouteName,
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    super.key,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesManager.homeRouteName: (context) => HomeScreen(),
        RoutesManager.introRouteName: (context) => IntroScreen(),
        RoutesManager.suraDetailsRouteName: (context) => SuraDetailsScreen(),
        RoutesManager.hadethDetailRouteName: (context) => HadethDetailsScreen(),
      },
      initialRoute: initialRoute,
    );
  }
}