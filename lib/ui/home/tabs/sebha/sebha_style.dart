import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';

class SebhaStyle extends StatelessWidget {
  final int counter;
  final String currentZkr;
  final double turns;
  final VoidCallback onTap;
  const SebhaStyle({super.key, required this.counter, required this.currentZkr, required this.turns, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 359,
                    right: 0,
                    left: 0,
                    child: Image.asset(AssetsManager.sebhaheader),
                  ),

                  Positioned(
                    top: 70,
                    bottom: 0,
                    right: 0,
                    left: 0,

                    child: GestureDetector(
                      onTap: onTap,
                      child: AnimatedRotation(
                        turns: turns,
                        duration: Duration(milliseconds: 300),
                        child: Image.asset(AssetsManager.sebhabody),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 90),
                          Text(
                            currentZkr,
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: .w700,
                              color: ColorsManager.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 20),

                          Text(
                            '$counter',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: .w700,
                              color: ColorsManager.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
  }
}