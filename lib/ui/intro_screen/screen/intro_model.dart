class IntroModel {
  final String image;
  final String titel;
  final String? description;

  IntroModel({required this.image, required this.titel, this.description});

  static List<IntroModel> introList = [
    IntroModel(
      image: 'assets/images/intro_logo.png',
      titel: 'Welcome To Islami App',
    ),

    IntroModel(
      image: 'assets/images/intro_masged.png',
      titel: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),

    IntroModel(
      image: 'assets/images/intro_quran.png',
      titel: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),

    IntroModel(
      image: 'assets/images/intro_sebha.png',
      titel: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),

    IntroModel(
      image: 'assets/images/intro_radio.png',
      titel: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
}
