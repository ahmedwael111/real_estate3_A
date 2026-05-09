import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'insurance_card.dart';

class InsuranceSection extends StatelessWidget {
  const InsuranceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Choose Insurance',
              style: getMediumStyle(
                fontSize: 12.sp,
                color: AppColors.textSecondaryColor,
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.black, size: 24.sp),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            const Expanded(
              child: InsuranceCard(
                icon: Icons.home_outlined,
                title: 'Bargain Home',
                price: '\$15/month',
              ),
            ),
            SizedBox(width: 12.w),
            const Expanded(
              child: InsuranceCard(
                icon: Icons.security_outlined,
                title: 'Smart Home C...',
                price: '\$12/month',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
