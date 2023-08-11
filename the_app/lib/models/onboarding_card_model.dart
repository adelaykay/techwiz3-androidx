import 'package:flutter/cupertino.dart';

class OnboardingCardModel {
  String main_text;
  String description;
  String swipe_text;
  List<Color> color;

  OnboardingCardModel({
    required this.main_text,
    required this.description,
    required this.swipe_text,
    required this.color,
  });
}

final List<OnboardingCardModel> candidates = [
  OnboardingCardModel(
    main_text: 'Streamline your subscriptions',
    description: 'Simplify your life by having all your movie streaming subscriptions in one place',
    swipe_text: 'Next',
    color: const [Color(0xFFD24848), Color(0xFFFFB49A)],
  ),
  OnboardingCardModel(
    main_text: 'Two, 2',
    description: 'Manager',
    swipe_text: 'New York',
    color: const [Color(0xFFD24848), Color(0xFFFFB49A)],
  ),
  OnboardingCardModel(
    main_text: 'Three, 3',
    description: 'Engineer',
    swipe_text: 'London',
    color: const [Color(0xFFD24848), Color(0xFFFFB49A)],
  ),
  OnboardingCardModel(
    main_text: 'Four, 4',
    description: 'Designer',
    swipe_text: 'Tokyo',
    color: const [Color(0xFFD24848), Color(0xFFFFB49A)],
  ),
];