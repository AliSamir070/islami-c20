import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaState();
}

class _SebhaState extends State<SebhaTab> {
  double angle = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [


            Image.asset(
              AssetsManager.sebha_background,
            ),

            Positioned(
              top: 200,
              child: Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.whiteColor,
                ),
              ),
            ),

            Positioned(height: 545,
              child: Image.asset(
                  AssetsManager.sebha_headd,
                  width: 145,height: 86,
                )
            ),




            Positioned(
              top: 300,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    counter++;
                    angle += 0.08;
                  });
                },
                child: SizedBox(
                  width: 380,
                  height: 380,

                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      Transform.rotate(
                        angle: angle,
                        child: Image.asset(
                          AssetsManager.sebha_image,
                          width: 380,
                        ),
                      ),



                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            "الحمدلله",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: ColorsManager.whiteColor,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "$counter",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: ColorsManager.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}