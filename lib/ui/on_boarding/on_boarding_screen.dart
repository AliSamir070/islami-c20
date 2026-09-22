import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/model/on_boarding_model.dart';
import 'package:islami_c20/ui/on_boarding/widgts/on_boarding_bottom_row.dart';
import 'package:islami_c20/ui/on_boarding/widgts/on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Image.asset(AssetsManager.header),
            SizedBox(height: 70),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: OnBoardingModel.onBoardingModelList.length,
                itemBuilder: (context, index) {
                  final item = OnBoardingModel.onBoardingModelList[index];
                  return OnBoardingItem(item: item);
                },
              ),
            ),
            OnBoardingBottomRow(
              controller: _controller,
              currentPage: currentPage,
            ),
          ],
        ),
      ),
    );
  }
}
