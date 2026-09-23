class OnBoardingModel {
  final String imagePath;
  final String title;
  final String? describtion;

 const OnBoardingModel({
    required this.imagePath,
    required this.title,
     this.describtion,
  });
  static const List<OnBoardingModel> onBoardingModelList = [
    OnBoardingModel(imagePath: 'assets/images/on_boarding1.png', title: 'Welcome To Islmi App',),
    OnBoardingModel(imagePath: 'assets/images/on_boarding2.png', title: 'Welcome To Islami',describtion: 'We Are Very Excited To Have You In Our Community'),
    OnBoardingModel(imagePath: 'assets/images/on_boarding3.png', title: 'Reading the Quran',describtion: 'Read, and your Lord is the Most Generous'),
    OnBoardingModel(imagePath: 'assets/images/on_boarding4.png', title: 'Bearish',describtion: 'Praise the name of your Lord, the Most High'),
    OnBoardingModel(imagePath: 'assets/images/on_boarding5.png', title: 'Holy Quran Radio',describtion: 'You can listen to the Holy Quran Radio through the application for free and easily'),
  ];
}
