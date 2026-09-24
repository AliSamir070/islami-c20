import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/resources/app_assets.dart';
import '../../core/resources/app_color.dart';
import '../../core/resources/app_text_styels.dart';
import '../../model/intro_model.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  Future<void> finishIntroScreens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("hasSeenOnboarding", true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 35,
              left: 35,
              top: 10,
              bottom: 50,
            ),
            child: Image.asset(AppAssets.headerImage),
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              controller: _controller,
              itemCount: IntroModel.listModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    spacing: 30,
                    children: [
                      Image.asset(IntroModel.listModel[index].image),
                      Text(
                        IntroModel.listModel[index].title,
                        style: AppTextStyles.title,
                      ),
                      Text(
                        IntroModel.listModel[index].description,
                        style: AppTextStyles.quran,
                        textAlign: .center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Visibility(
                  visible: currentPage != 0,
                  child: TextButton(
                    onPressed: () {
                      _controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text("Back", style: AppTextStyles.click),
                  ),
                ),
                Row(
                  children: List.generate(IntroModel.listModel.length, ((
                    index,
                  ) {
                    return Container(
                      width: currentPage == index ? 18 : 7,
                      height: 7,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: currentPage == index
                            ? AppColors.goldColor
                            : AppColors.grayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  })),
                ),
                TextButton(
                  onPressed: () async {
                    if (currentPage == IntroModel.listModel.length - 1) {
                      await finishIntroScreens();
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesManager.homeRouteName,
                      );
                    } else {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    currentPage == IntroModel.listModel.length - 1
                        ? "Done"
                        : "Next",
                    style: AppTextStyles.click,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
