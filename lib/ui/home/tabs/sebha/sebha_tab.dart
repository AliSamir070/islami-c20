import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}
const List<String> _phrases = [
  'سبحان الله',
  'الحمد لله',
  'الله أكبر',
  'لا حول ولا قوة الا بالله'
  'استغفر الله العظيم'
];

class _SebhaTabState extends State<SebhaTab> {
  int _count = 0;
  int _phraseIndex = 0;
  double _rotationAngle = 0;

  void _onTap(){
    setState(() {
      _count++;
      _rotationAngle += 0.3;

      if(_count == 33){
        _count = 0;
        _phraseIndex = (_phraseIndex + 1) % _phrases.length;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.sebhaBack),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AssetsManager.header,
                width: screenWidth * 0.7,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.w600,
                color: ColorsManager.whiteColor,
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: _onTap,
                    child: Transform.rotate(
                      angle: _rotationAngle,
                      child: Image.asset(
                        AssetsManager.sebhaBady,
                        width: screenWidth * 0.95,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, -0.98), // بدل -1.1
                    child: Image.asset(
                      AssetsManager.sebhaheder,
                      width: screenWidth * 0.35,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _phrases[_phraseIndex],
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.whiteColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$_count',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          color: ColorsManager.whiteColor,
                        ),
                      ),
                    ],
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
