

import 'package:islami_c20/ui/onbarding/widgets/modal_list.dart';

import '../../../core/resources/assets_manager.dart';


class ListSheet {
  List<ModalList>listView=[
    ModalList(title: "",text: "Welcome To Islami App", imagePath: AssetsManager.welcome),
    ModalList(title: "Welcome To Islami   ",text: "We Are Very Excited To Have You In Our Community", imagePath: AssetsManager.mosqueBoard),
    ModalList(title: "Reading the Quran ",text: " Read,and your Lord is the Most Generous", imagePath: AssetsManager.quranBoard),
    ModalList(title: "Bearish  ",text: "Praise the name of your Lord, the Most High", imagePath: AssetsManager.doaaBoard),
    ModalList(title: "Holy Quran Radio ",text: "You can listen to the Holy Quran Radio through the application for free and easily", imagePath: AssetsManager.maicBoard),
  ];
}