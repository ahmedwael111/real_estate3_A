import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'info_column.dart';

class BookingInformationSuccessSection extends StatelessWidget {
  const BookingInformationSuccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.lightGreenBg,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check_circle, color: AppColors.darkGreenText, size: 20.sp),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  'Congratulations! We have sent your booking details to the property owner.',
                  style: getMediumStyle(
                    fontSize: 12.sp,
                    color: AppColors.darkGreenText,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: InfoColumn(label: 'Full Name', value: 'Wade Warren'),
            ),
            const Expanded(
              child: InfoColumn(label: 'Numb. Phone', value: '(603) 555-0123'),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        const InfoColumn(label: 'Email Address', value: 'alma.lawson@example.com'),
      ],
    );
  }
}
