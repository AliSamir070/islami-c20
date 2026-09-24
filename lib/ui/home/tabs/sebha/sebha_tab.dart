import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/app_assets.dart';
import 'package:islami_c20/core/resources/app_text_styels.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  final List<String> azkar = ["سبحان الله", "الحمدلله", "الله أكبر"];
  int currentIndex = 0;
  int counter = 0;
  double rotationAngle = 0.0;

  void onSebhaTapped() {
    setState(() {
      counter++;
      rotationAngle += 0.1;

      if (counter > 33) {
        counter = 0;
        currentIndex = (currentIndex + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.backgroundSebha),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SafeArea(
            child: Align(
              alignment: .center,
              child: Image.asset(
                AppAssets.headerImage,
                width: screenWidth * 0.7,
              ),
            ),
          ),
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ", style: AppTextStyles.sebha),

          Image.asset(AppAssets.sebhaHead, width: screenWidth * 0.4),
          GestureDetector(
            onTap: onSebhaTapped,
            child: Transform.translate(
              offset: const Offset(0, -7),
              child: Stack(
                children: [
                  Transform.rotate(
                    angle: rotationAngle,
                    child: Image.asset(
                      AppAssets.sebhaBody,
                      width: screenWidth * .9,
                    ),
                  ),

                  Positioned.fill(
                    child: Center(
                      child: Column(
                        mainAxisSize: .min,
                        children: [
                          Text(azkar[currentIndex], style: AppTextStyles.sebha),
                          SizedBox(height: 30),
                          Text("$counter", style: AppTextStyles.sebha),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}