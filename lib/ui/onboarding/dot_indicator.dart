import 'package:flutter/material.dart';

import '../../core/resources/colors_manager.dart';

class DotIndicator extends StatelessWidget {
 final bool isActive;
  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 5),
      duration: Duration(milliseconds: 300),
      height: 10,
      width: isActive? 20 : 10,
      decoration:BoxDecoration(
        color: isActive? ColorsManager.goldColor :Colors.grey[400],
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}
