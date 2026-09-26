class Onboarding {
  String imageassets;
  String text1;
  String text2;

  Onboarding({
    required this.imageassets,
    required this.text1,
    required this.text2,
  });
}

List<Onboarding> onboardingScreen = [
  Onboarding(
    imageassets: "assets/onbording/Frame 3 (3).png",
    text1: "Welcome To Islmi App",
    text2: "",
  ),

  Onboarding(
    imageassets: "assets/onbording/Frame 3 (4).png",
    text1: "Welcome To Islami",
    text2: "We Are Very Excited To Have You In Our Community",
  ),

  Onboarding(
    imageassets: "assets/onbording/Frame 3.png",
    text1: "Reading the Quran",
    text2: "Read, and your Lord is the Most Generous",
  ),

  Onboarding(
    imageassets: "assets/onbording/Frame 3 (1).png",
    text1: "Bearish",
    text2: "Praise the name of your Lord, the Most High",
  ),

  Onboarding(
    imageassets: "assets/onbording/Frame 3 (2).png",
    text1: "Holy Quran Radio",
    text2: "You can listen to the Holy Quran Radio\n"
        "through the application for free and easily",
  ),
];