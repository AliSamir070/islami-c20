import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:islami_c20/model/onbording_model.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/routes_manager.dart';

class onbording extends StatefulWidget {
  const onbording({super.key});

  @override
  State<onbording> createState() => _onbordingState();
}

class _onbordingState extends State<onbording> {
  int currentPage = 0;

  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),

        child: Column(
          children: [


            Image.asset(
              "assets/onbording/Group 31.png",
            ),

            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboardingScreen.length,

                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },

                itemBuilder: (context, index) {
                  return Column(
                    children: [

                      Image.asset(
                        onboardingScreen[index].imageassets,
                      ),

                      const SizedBox(height: 20),

                      Text(
                        onboardingScreen[index].text1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: ColorsManager.goldColor,
                        ),
                      ),

                      const SizedBox(height: 40),


                      Text(
                        onboardingScreen[index].text2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: ColorsManager.goldColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [


                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      if (currentPage > 0) {
                        pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      "BACK",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.goldColor,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: onboardingScreen.length,

                    effect: ExpandingDotsEffect(
                      dotWidth: 8,
                      dotHeight: 8,
                      spacing: 6,
                      activeDotColor: ColorsManager.goldColor,
                      dotColor: Colors.grey,
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesManager.homeRouteName);

                      },

                    child: Text(
                      "Finish",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.goldColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}