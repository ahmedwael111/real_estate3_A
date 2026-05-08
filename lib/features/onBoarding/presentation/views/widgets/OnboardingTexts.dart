

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class OnboardingTexts extends StatelessWidget {
  const OnboardingTexts({super.key,required this.title,required this.subtitle});
 final String title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: getMediumStyle(fontSize: 20, color: Colors.black),
        ),
        SizedBox(height: 12.h),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: getRegularStyle(fontSize: 14.sp, color: AppColors.grey),
        ),
      ],
    );
  }
}