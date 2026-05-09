import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CancellationPolicySection extends StatelessWidget {
  const CancellationPolicySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Free cancellation within 48 hours. If canceled before June 1, you will receive a partial refund. Read the Full Accommodation Policy for more details.',
          style: getMediumStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondaryColor,
            height: 1.5,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Read more',
          style: getMediumStyle(
            fontSize: 12.sp,
            color: AppColors.teal, // using teal
          ),
        ),
      ],
    );
  }
}
