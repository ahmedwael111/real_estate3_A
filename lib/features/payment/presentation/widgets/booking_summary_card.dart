import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class BookingSummaryCard extends StatelessWidget {
  const BookingSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=500',
                ), // Placeholder
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sunnyslade House',
                  style: getBoldStyle(fontSize: 14.sp, color: AppColors.black),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Beverly Hills, CA',
                  style: getRegularStyle(
                    fontSize: 12.sp,
                    color: AppColors.textSecondaryColor,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      color: AppColors.black,
                      size: 20.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '4.9 Rating',
                      style: getMediumStyle(
                        fontSize: 12.sp,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '(10 Reviews)',
                      style: getRegularStyle(
                        fontSize: 14.sp,
                        color: AppColors.black,
                      ).copyWith(decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
