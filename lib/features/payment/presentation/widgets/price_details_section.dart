import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'custom_divider.dart';

class PriceDetailsSection extends StatelessWidget {
  const PriceDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPriceRow('House Prices', '\$120.000'),
        SizedBox(height: 16.h),
        _buildPriceRow('HabiSpace service fee', '\$250'),
        SizedBox(height: 16.h),
        const CustomDivider(),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: getBoldStyle(
                fontSize: 14.sp,
                color: AppColors.black,
              ),
            ),
            Text(
              '\$120.250',
              style: getBoldStyle(
                fontSize: 14.sp,
                color: AppColors.black,
              ),
            ),
            
          ],
        ),
        SizedBox(height: 16.h),

      ],
    );
  }

  Widget _buildPriceRow(String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: getMediumStyle(
            fontSize: 12.sp,
            color: AppColors.black,
          ),
        ),
        Text(
          amount,
          style: getMediumStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondaryColor,
          ),
        ),
      ],
    );
  }
}
