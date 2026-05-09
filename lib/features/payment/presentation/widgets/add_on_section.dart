import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class AddOnSection extends StatelessWidget {
  const AddOnSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Monthly Add-On',
              style: getRegularStyle(
                fontSize: 14.sp,
                color: AppColors.textSecondaryColor,
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.black, size: 24.sp),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildAddOnCard(
                icon: Icons.delete_outline,
                title: 'Trash Money',
                price: 'Rp 30.000/month',
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildAddOnCard(
                icon: Icons.local_parking_outlined,
                title: 'Car & Motorcy...',
                price: 'Rp 20.000/month',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddOnCard({required IconData icon, required String title, required String price}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.lightGrayColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.greychip),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.teal),
            ),
            child: Icon(icon, color: AppColors.teal, size: 16.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: getMediumStyle(
                    fontSize: 14.sp,
                    color: AppColors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  price,
                  style: getRegularStyle(
                    fontSize: 12.sp,
                    color: AppColors.textSecondaryColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
