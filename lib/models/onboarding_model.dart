class OnboardingModel {
  final String topMessage;
  final String? topImage;
  final String mainImage;
  final String quote;
  final String buttonText;

  OnboardingModel({
  required this.topMessage,
  this.topImage,
  required this.mainImage,
  required this.quote,
  required this.buttonText,
  });
}