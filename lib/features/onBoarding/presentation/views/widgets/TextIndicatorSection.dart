import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/funcations/app_functions.dart';
import 'package:real_estate3_a/features/Auth/presentation/views/SignIn_view.dart';
import 'package:real_estate3_a/features/Auth/presentation/views/SignUp_view.dart';

import 'DotsIndicator.dart';
import 'Nav_button.dart';
import 'TextsPageView.dart';

class TextIndicatorSection extends StatelessWidget {
  const TextIndicatorSection({
    super.key,
    required this.pageController,
    required this.currentpage,
  });

  final PageController pageController;
  final int currentpage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextsPageView(pageController: pageController),

          // SizedBox(height: 18.h),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DotsIndicator(currentpage: currentpage),
              Row(
                children: [
                  NavButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () {
                      if (currentpage > 0) {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                  ),
                  SizedBox(width: 5.w),
                  NavButton(
                    icon: Icons.arrow_forward_ios,
                    onTap: () {
                      if (currentpage < 2) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        AppFunctions.navigateTo(context, SigninView());
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
