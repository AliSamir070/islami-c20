import 'package:flutter/material.dart';
import 'package:islami_c20/ui/home/screen/home_screen.dart';

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
      routes: {
        RoutesManager.homeRouteName:(context)=>HomeScreen()
      },
      initialRoute: RoutesManager.homeRouteName,
    );
  }
}

