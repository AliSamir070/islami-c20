import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/core/resources/routes_manager.dart';
import 'package:islami_c20/core/resources/shared_pref.dart';
import 'package:islami_c20/model/on_boarding_model.dart';

class OnBoardingBottomRow extends StatelessWidget {
  final PageController controller;
  final int currentPage;

  const OnBoardingBottomRow({
    super.key,
    required this.controller,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    final lastPage = OnBoardingModel.onBoardingModelList.length - 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: currentPage != 0,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: ColorsManager.blackColor,
            ),
            onPressed: currentPage == 0
                ? null
                : () => controller.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
            child: Text(
              'Back',
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w700,
                color: ColorsManager.goldColor,
              ),
            ),
          ),
        ),
        DotsIndicator(
          dotsCount: OnBoardingModel.onBoardingModelList.length,

          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            activeColor: ColorsManager.goldColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),

        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: ColorsManager.blackColor,
          ),
          onPressed: currentPage == lastPage
              ? () {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutesManager.homeRouteName,
                  );
                  SharedPref.setBool(key: 'isFirstTime', value: false);
                }
              : () => controller.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
          child: Text(
            currentPage == lastPage ? 'Finish' : 'Next',
            style: TextStyle(
              fontSize: 16,
              fontWeight: .w700,
              color: ColorsManager.goldColor,
            ),
          ),
        ),
      ],
    );
  }
}
