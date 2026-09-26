import 'package:flutter/material.dart';
import 'package:islami_c20/ui/hadeth_details/screen/hadeth_details_screen.dart';
import 'package:islami_c20/ui/home/screen/home_screen.dart';
import 'package:islami_c20/ui/intro_screen/screen/intro_screen.dart';
import 'package:islami_c20/ui/splash_screen.dart';
import 'package:islami_c20/ui/sura_details/screen/sura_details_screen.dart';

import 'core/resources/routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        RoutesManager.introScreenRouteName: (context) => IntroScreen(),
        RoutesManager.homeRouteName:(context)=>HomeScreen(),
        RoutesManager.suraDetailsRouteName:(context)=>SuraDetailsScreen(),
        RoutesManager.hadethDetailRouteName:(context)=>HadethDetailsScreen(),
      },
      //initialRoute: RoutesManager.homeRouteName,
    );
  }
}

