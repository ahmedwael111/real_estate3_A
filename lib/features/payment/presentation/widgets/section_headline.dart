import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/app_colors.dart';

class SectionHeadline extends StatelessWidget {
  final String title;
  const SectionHeadline({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
      child: Text(
        title,
        style: getBoldStyle(
          fontSize: 16.sp,
          color: AppColors.black,
        ),
      ),
    );
  }
}
