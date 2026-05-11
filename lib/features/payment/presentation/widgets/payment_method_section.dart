import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PaymentMethodSection extends StatelessWidget {
  final VoidCallback onTap;
  const PaymentMethodSection({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.credit_card, color: AppColors.black, size: 24.sp),
                SizedBox(width: 16.w),
                Text(
                  'Bank Transfer',
                  style: getMediumStyle(
                    fontSize: 14.sp,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            Icon(Icons.chevron_right, color: AppColors.black, size: 24.sp),
          ],
        ),
      ),
    );
  }
}
