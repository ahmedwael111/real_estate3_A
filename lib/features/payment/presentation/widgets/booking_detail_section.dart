import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class BookingDetailSection extends StatelessWidget {
  const BookingDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRowItem(
          title: 'Book Appointment',
          value: '12 September 2025 - 09.00',
        ),
        SizedBox(height: 24.h),
        _buildRowItem(
          title: 'Person',
          value: '4 person',
        ),
        SizedBox(height: 16.h,),
      ],
    );
  }

  Widget _buildRowItem({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
              'Edit',
              style: getMediumStyle(
                fontSize: 12.sp,
                color: AppColors.teal,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: getRegularStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondaryColor,
          ),
        ),
      ],
    );
  }
}
