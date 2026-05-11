import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:real_estate3_a/features/onBoarding/presentation/views/widgets/OnboardingTexts.dart';

import '../../../data/onBoardingModel.dart';

class TextsPageView extends StatelessWidget {
  const TextsPageView({super.key, required this.pageController});
  final PageController pageController;
  static final textIndicatorList = [
    OnboardingModel(
      title: "Find Your Perfect Home, Anywhere",
      subtitle:
          "Start your journey with a comfortable and reliable home search",
    ),
    OnboardingModel(
      title: "Browse Easily",
      subtitle: "Explore properties with ease",
    ),
    OnboardingModel(
      title: "Close the Deal",
      subtitle: "Get your dream home fast",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
      scrollDirection: Axis.horizontal,
      controller: pageController,
      children: List.generate(
        3,
        (index) => OnboardingTexts(
          title: textIndicatorList[index].title,
          subtitle: textIndicatorList[index].subtitle,
        ),
      ),
    );
  }
}
