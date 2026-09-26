import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0; //هزن فيها عدد التسبيح الحالي
  double rotationAngle = 0.0; //ده علشان يخزن زايه التسبيح مع كل ضغطه
  final List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];
  int currentAzkar = 0; //علشان اعرف انا واقفه عند انهي ذكر
  void onSebhaPressed() {
    setState(() {
      counter++;
      rotationAngle += 0.1; //علشان يلف بزايه
      if (counter > 33) {
        counter = 0;
        currentAzkar = (currentAzkar + 1) % azkar
            .length; //ده كدا عملت loop هتبدا من الصفر وكل ما تخلص33 يزود واحد ويخش علي التسبيح اللي بعده واول ما يوصل ل3 يرجع من الصفر تاني لانه اخره من 0ل2
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Stack(
      children: [
        Image.asset('assets/images/sebha_background.png',
          width: screenWidth,
          height: screenHeight,),
        SafeArea(
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/img_header.png',
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.18,),
                SizedBox(height: 16,),
                Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.whiteColor,
                  ),
                ),
                SizedBox(height: 16,),
                Image.asset(
                  'assets/images/header_sebha.png',
                  width: screenWidth * 0.35,
                  height: screenHeight * 0.1,
                  fit: BoxFit.contain,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector( //شكل السبحه
                      onTap: onSebhaPressed,
                      child: Transform.rotate(
                        angle: rotationAngle,
                        child: SizedBox(
                          child: Image.asset('assets/images/body_sebha.png',
                            width: screenWidth * 0.85,
                            height: screenWidth * 0.85,
                          ),
                        ),
                      ),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(azkar[currentAzkar],
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 36,
                            color: ColorsManager.whiteColor,
                          ),),
                        const SizedBox(height: 12,),
                        Text('$counter',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 36,
                            color: ColorsManager.whiteColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),

              ],

            ),
          ),
        ),
      ],




    );
  }
}
