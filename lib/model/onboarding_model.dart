import '../core/resources/assets_manager.dart';

class OnboardingModel {
  String imagePath;
  String title;
  String? description;
  OnboardingModel({
     this.imagePath=AssetsManager.onBoarding1,
     this.title="Random Text",
    this.description
  });
}