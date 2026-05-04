import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CardDetailsSection extends StatelessWidget {
  const CardDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please fill out the form below. Enter your card account details.',
          style: getMediumStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondaryColor,
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'Card Number',
          style: getBoldStyle(
            fontSize: 14.sp,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.greychip),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1243 _2133 _9832 _3200',
                style: getMediumStyle(
                  fontSize: 14.sp,
                  color: AppColors.black,
                ),
              ),
              Text(
                'VISA',
                style: getBoldStyle(
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                ).copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Expiration Date', style: getBoldStyle(fontSize: 14.sp, color: AppColors.black)),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: AppColors.greychip),
                          ),
                          child: Text('12', style: getMediumStyle(fontSize: 14.sp, color: AppColors.black)),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: AppColors.greychip),
                          ),
                          child: Text('2026', style: getMediumStyle(fontSize: 14.sp, color: AppColors.black)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CCV', style: getBoldStyle(fontSize: 14.sp, color: AppColors.black)),
            SizedBox(height: 12.h),
            Container(
              width: 160.w,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.greychip),
              ),
              child: Text('568', style: getMediumStyle(fontSize: 14.sp, color: AppColors.black)),
            ),
          ],
        ),
      ],
    );
  }
}
