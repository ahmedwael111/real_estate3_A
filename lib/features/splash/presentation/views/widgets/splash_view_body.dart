import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate3_a/core/funcations/app_functions.dart';
import 'package:real_estate3_a/features/onBoarding/presentation/views/onBoardingView.dart';

import 'package:real_estate3_a/generated/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    ExecuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(Assets.assetsSplashPng1)]),
    );
  }
  void ExecuteNavigation() {
    Future.delayed(const Duration(milliseconds: 2500), () {

      AppFunctions.navigateTo(context, Onboardingview());

    });
  }
}
