import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/core/resources/routes_manager.dart';
import 'package:islami_c20/ui/intro_screen/screen/intro_model.dart';

import '../share_preference.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController =
      PageController(); //علشان اعرف الصفحه ويتنقل مبينهم
  int _currentIndex = 0; //علشان اخزن فيه الصفحه اللي انا فيها
  final List<IntroModel> _introData =
      IntroModel.introList; //دي اللي هنادي بيها علي الليست فسميته introdata

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/img_header.png',
                  width: 291,
                  height: 171,
                ),
                SizedBox(height: 26),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _introData.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex =
                            index; //كدا قولتله ان مع كل مره الصفحه هتتجدد هتجدد رقم الصفحه
                      });
                    },

                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(_introData[index].image, height: 415),
                          SizedBox(height: 30),
                          Text(
                            _introData[index].titel,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: ColorsManager.goldColor,
                            ),
                            textAlign: TextAlign
                                .center, //علشان لو الكلمه طويله فيظبطها
                          ),
                          if (_introData[index].description != null) ...[
                            const SizedBox(height: 24),
                            Text(
                              _introData[index].description!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: ColorsManager.goldColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _currentIndex > 0
                          ? TextButton(
                              onPressed: () {
                                _pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Text(
                                'back',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: ColorsManager.goldColor,
                                ),
                              ),
                            )
                          : const SizedBox(width: 10),

                      //علشان مش هيكون في زرار الباك وانا عند اول صوره
                      Row(
                        children: List.generate(
                          _introData.length,
                          (index) => Container(
                            //هنا يعتبر بقوله روحلي لف انا عندي كام صفحه وارجع اعمل لكل كونتينر نقطه
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: _currentIndex == index ? 18 : 7,
                            //بقوله للي واقف عليها هتبقا 18 والعاديه 7
                            height: 7,
                            decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? ColorsManager.goldColor
                                  : Color(0xFF707070),
                              borderRadius: BorderRadius.circular(27),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          if (_currentIndex < _introData.length - 1) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            await SharePreference.setIntroSeen(); //الحتة دي هي اللي بتسجل إن المستخدم خلص الـ Intro خلاص
                            Navigator.pushReplacementNamed(
                              context,
                              RoutesManager
                                  .homeRouteName, //الانتقال للشاشة الرئيسية
                            );
                          }
                        },
                        child: Text(
                          _currentIndex == _introData.length - 1
                              ? 'Finish'
                              : 'Next',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
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
        ),
      ),
    );
  }
}
