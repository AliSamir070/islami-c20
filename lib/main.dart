import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/routes_manager.dart';
import 'package:islami_c20/core/resources/shared_pref.dart';
import 'package:islami_c20/ui/home/screen/home_screen.dart';
import 'package:islami_c20/ui/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFirstTime = false;
  @override
  void initState() {
    isFirstTime = SharedPref.getBool(key: 'isFirstTime') ?? true;
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isFirstTime
          ? RoutesManager.onBoardingRouteName
          : RoutesManager.homeRouteName,
      routes: {
        RoutesManager.onBoardingRouteName: (context) =>
            const OnBoardingScreen(),
        RoutesManager.homeRouteName: (context) => HomeScreen(),
      },
    );
  }
}
