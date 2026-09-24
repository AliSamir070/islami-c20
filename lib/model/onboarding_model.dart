import '../core/resources/assets_manager.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String? description;

  const OnboardingModel({
    required this.image,
    required this.title,
    this.description,
});
}
const List<OnboardingModel> onboardingModel =[
  OnboardingModel(
    image: AssetsManager.onboarding1,
    title: "Welcome To Islmi App",
  ),
  OnboardingModel(
      image: AssetsManager.onboarding2,
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community"
  ),
  OnboardingModel(
      image: AssetsManager.onboarding3,
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous"
  ),
  OnboardingModel(
      image: AssetsManager.onboarding4,
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High"
  ),
  OnboardingModel(
      image: AssetsManager.onboarding5,
      title: "Holy Quran Radio",
      description: "You can listen to the Holy Quran Radio through the application for free and easily"
  ),
];