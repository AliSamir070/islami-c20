import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/model/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel item;
  const OnboardingPage({super.key , required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Expanded(child: Image.asset(item.image,fit: BoxFit.fill,)),
          SizedBox(height: 39,),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorsManager.goldColor,
                fontSize: 20,
                fontWeight: FontWeight.w700
            ),
          ),
          if(item.description != null) ...[
            SizedBox(height: 27,),
            Text(
              item.description!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorsManager.goldColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),
            )
          ],
        ],
      ),
    );
  }
}
