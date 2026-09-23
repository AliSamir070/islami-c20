import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/model/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel item;

  const OnBoardingItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,

      spacing: 40,
      children: [
        Image.asset(item.imagePath),
        Text(
          item.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: .w700,
            color: ColorsManager.goldColor,
          ),
        ),
        if (item.describtion != null) ...{
          Text(
            textAlign: TextAlign.center,
            item.describtion!,
            style: TextStyle(
              fontSize: 22,
              fontWeight: .w700,
              color: ColorsManager.goldColor,
            ),
          ),
        },
      ],
    );
    
  }
}