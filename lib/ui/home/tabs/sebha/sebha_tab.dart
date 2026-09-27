import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int _counter = 0;
  int _currentIndex = 0;
  double _turns = 0.0;
  final List<String> _azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
  ];
  void _onSebhaTapped() {
    setState(() {
      _turns += 1 / 33;
      if (_counter < 33) {
        _counter++;
      } else {
        _counter = 0;
        _currentIndex = (_currentIndex + 1) % _azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/intro_images/background_sebha.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            ColorsManager.blackColor.withValues(
              alpha: 0.9,
            ), // ana msh 3aref 23ml el filter 2d eeh ana bhbdha wi 5las msh 3aref 25leha 28m2 2zay
            BlendMode.darken,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/images/img_header.png', height: 150),
            const SizedBox(
              height: 50,
            ), // ana 7ett el msafat deh bt3sbny wi kool 4waya msh bb2a 3aref 23ml eeh
            const Text(
              "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorsManager.whiteColor,
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: _onSebhaTapped,
                  child: SizedBox(
                    height: 380,
                    width: 300,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 60,
                          child: AnimatedRotation(
                            turns: _turns,
                            duration: const Duration(milliseconds: 200),
                            child: Image.asset(
                              'assets/intro_images/Sebha.png',
                              width: 300,
                              height: 300,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Image.asset(
                            'assets/intro_images/sebha_head.png',
                            height: 75,
                          ),
                        ),
                        Positioned(
                          top: 160,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _azkar[_currentIndex],
                                style: const TextStyle(
                                  color: ColorsManager.whiteColor,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                '$_counter',
                                style: const TextStyle(
                                  color: ColorsManager.whiteColor,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
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
            ),
          ],
        ),
      ),
    );
  }
}
