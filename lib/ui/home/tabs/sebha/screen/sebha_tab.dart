import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/routes_manager.dart';
import 'dart:math';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter=33;
  String text="";
  int position=0;
  double angle=0;
  List<String>listText=["سبحان الله","الحمد لله","لا إله إلا الله","الله أكبر"];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.backGroundSebha),
          fit: .cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Image.asset(AssetsManager.mosque),
            ),
            SizedBox(height: 16),
            Text(
              textAlign: .center,
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: .w700,
              ),
            ),
            SizedBox(height: 16),

            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsManager.headerSebha,
                    height: 86,
                    width: 145,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26, right: 26, top: 74),
                  child: Align(
                    alignment: Alignment.center,
                    child: AnimatedRotation(
                        turns: angle / (2 * pi),
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(AssetsManager.SebhaBody
                        )),
                  ),
                ),

                InkWell(
                  onTap: () {
                  setState(() {
                    counter-=1;
                    angle += 0.2;
                    if(counter==0){
                      counter=33;
                      if(position<3){
                        position+=1;
                      }
                      else{
                        position=0;
                      }
                    }
                  }
                  );
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(height: 190,),
                        Text(
                          listText[position],
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: .w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${counter}",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: .w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}