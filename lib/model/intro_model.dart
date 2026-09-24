import '../core/resources/app_assets.dart';

class IntroModel {
  final String image;
  final String title;
  final String description;

  const IntroModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static const List<IntroModel> listModel = [
    IntroModel(
      image: AppAssets.introWelcome,
      title: "Welcome To Islmi App",
      description: "",
    ),
    IntroModel(
      image: AppAssets.introIslami,
      title: "Welcome To Islmi",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    IntroModel(
      image: AppAssets.introQuran,
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    IntroModel(
      image: AppAssets.introBearish,
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    IntroModel(
      image: AppAssets.introRadio,
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
