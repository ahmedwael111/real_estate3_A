import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/funcations/app_functions.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
import 'package:real_estate3_a/features/Auth/presentation/views/SignIn_view.dart';

import 'package:real_estate3_a/features/Auth/presentation/views/SignUp_view.dart';

import 'package:real_estate3_a/features/onBoarding/presentation/views/widgets/custom_OnBoarding_button.dart';

import 'TextIndicatorSection.dart';
import 'onBoarding_Image.dart';

class Onboardingviewbody extends StatefulWidget {
  const Onboardingviewbody({Key? key}) : super(key: key);

  @override
  State<Onboardingviewbody> createState() => _OnboardingviewbodyState();
}

class _OnboardingviewbodyState extends State<Onboardingviewbody> {
  late PageController pageController;
  int currentpage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentpage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        onBoarding_Image(),
        SizedBox(height: 48.h),
        TextIndicatorSection(
          pageController: pageController,
          currentpage: currentpage,
        ),
        SizedBox(height: 30.h),
        Custom_OnBoarding_Button(
          text: "Continue",
          onpress: () {
            AppFunctions.navigateTo(context, SigninView());
          },
          buttonColor: AppColors.splashColor,
        ),
      ],
    );
  }
}
