import 'package:flutter/cupertino.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';

class ScrollContainer extends StatelessWidget {
  final int index;
  bool isSellected;
   ScrollContainer({super.key,required this.index,required this.isSellected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 10),
        curve: Curves.bounceIn,
        height: 7,
        width: 7,
        decoration: BoxDecoration(
        color: isSellected?ColorsManager.goldColor:Color(0xff707070)
        ,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
