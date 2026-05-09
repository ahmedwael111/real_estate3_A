import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ResidentDataSection extends StatelessWidget {
  const ResidentDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cameron Williamson',
          style: getRegularStyle(
            fontSize: 16.sp,
            color: AppColors.textSecondaryColor,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          '(603) 555-0123',
          style: getRegularStyle(
            fontSize: 16.sp,
            color: AppColors.textSecondaryColor,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'alma.lawson@example.com',
          style: getRegularStyle(
            fontSize: 16.sp,
            color: AppColors.textSecondaryColor,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.lightGreenBg,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            'Original identification card (KTP/KITAS) and Marriage Certificate (for couples) are required at check-in.',
            style: getRegularStyle(
              fontSize: 14.sp,
              color: AppColors.darkGreenText,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
