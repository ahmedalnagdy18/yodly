final onboardingList = [
  Onboarding(
    image: "images/onboarding1.png",
    title: "Tell us what you think",
    subtitle: "You can express your opinion freely and share it with others",
  ),
  Onboarding(
    image: "images/onboarding2.png",
    title: "Share your thoughts",
    subtitle:
        "Share your opinion objectively and freely with others to help them",
  ),
  Onboarding(
    image: "images/onboarding3.png",
    title: "Make your review helpful",
    subtitle:
        "Share your opinion objectively and freely with others to help them",
  ),
];

class Onboarding {
  final String image;

  final String title;

  final String subtitle;

  Onboarding(
      {required this.image, required this.title, required this.subtitle});
}
