import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/core/resources/routes_manager.dart';
import 'package:islami_c20/ui/onbarding/widgets/list_view.dart';
import 'package:islami_c20/ui/onbarding/widgets/scroll_container.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  PageController _controller = PageController();
  int position = 0;


  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff202020),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70, top: 16),
              child: Image.asset(AssetsManager.mosque),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PageView.builder(
                  controller: _controller,
                  itemCount: ListSheet().listView.length,
                  onPageChanged: (value) {
                    setState(() {
                      position = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(ListSheet().listView[index].imagePath),
                        SizedBox(height: 10),

                        Text(
                          textAlign: .center,
                          ListSheet().listView[index].title,
                          style: TextStyle(
                            color: ColorsManager.goldColor,
                            fontSize: 24,
                            fontWeight: .w700,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          textAlign: TextAlign.center,
                          ListSheet().listView[index].text,
                          style: TextStyle(
                            color: ColorsManager.goldColor,
                            fontSize: 20,
                            fontWeight: .w700,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    _controller.previousPage(
                      duration: Duration(milliseconds: 2),
                      curve: Curves.bounceInOut,
                    );
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                      color: ColorsManager.goldColor,
                      fontWeight: .w700,
                      fontSize: 16,
                    ),
                  ),
                ),

                Row(children: [
                  ScrollContainer(index: 0,isSellected: position==0,),
                  ScrollContainer(index: 1,isSellected: position==1,),
                  ScrollContainer(index: 2,isSellected: position==2,),
                  ScrollContainer(index: 3,isSellected: position==3,),
                  ScrollContainer(index: 4,isSellected: position==4,),
                ]
                ),

                (position == 4)
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(RoutesManager.homeRouteName);
                        },
                        child: Text(
                          "Finish",
                          style: TextStyle(
                            color: ColorsManager.goldColor,
                            fontWeight: .w700,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 10),
                            curve: Curves.bounceInOut,
                          );
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: ColorsManager.goldColor,
                            fontWeight: .w700,
                            fontSize: 16,
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
