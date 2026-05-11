import 'package:flutter/material.dart';
import 'package:real_estate3_a/core/funcations/app_functions.dart';
import 'package:real_estate3_a/features/onBoarding/presentation/views/onBoardingView.dart';

import 'package:real_estate3_a/generated/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(Assets.assetsSplashPng1)],
      ),
    );
  }

  void executeNavigation() {
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (!context.mounted) {
        return;
      } else {
        AppFunctions.navigateTo(context, Onboardingview());
      }
    });
  }
}
