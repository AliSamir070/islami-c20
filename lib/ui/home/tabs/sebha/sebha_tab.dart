import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBack),
          colorFilter: ColorFilter.mode(
            Color(0xff202020B2).withValues(alpha: .70),
            BlendMode.darken,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          children: [
            Image.asset(AssetsManager.header),
            SizedBox(height: 16),
            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: TextStyle(
                fontSize: 36,
                fontWeight: .w700,
                color: ColorsManager.whiteColor,
              ),
            ),
                        SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
