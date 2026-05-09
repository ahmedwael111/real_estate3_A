import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class InfoColumn extends StatelessWidget {
  final String label;
  final String value;

  const InfoColumn({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getMediumStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondaryColor,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: getMediumStyle(
            fontSize: 14.sp,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
