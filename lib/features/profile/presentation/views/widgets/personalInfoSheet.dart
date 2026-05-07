
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';

import '../../../domain/entity/profileEntity.dart';

class PersonalInfoSheet extends StatelessWidget {
  const PersonalInfoSheet({required this.profile});
  final ProfileEntity profile;

  Widget _row(BuildContext context, IconData icon, String label, String value) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Container(
              width: 38.w,
              height: 38.h,
              decoration: BoxDecoration(
                color:  const Color(0xFFFFF3D6),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: const Color(0xFF8B6508), size: 18.sp),
            ),
            SizedBox(width: 14.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey[500])),
                SizedBox(height: 2.h),
                Text(value,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkprimarycolor)),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.all(24.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text('Personal Information',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkprimarycolor)),
          SizedBox(height: 16.h),
          _row(context, Icons.person_outline, 'Full Name', profile.name),
          Divider(color: Colors.grey.shade100),
          _row(context, Icons.email_outlined, 'Email', profile.email),
          Divider(color: Colors.grey.shade100),
          _row(context, Icons.shield_outlined, 'Role', profile.role.toUpperCase()),
          Divider(color: Colors.grey.shade100),
          _row(context, Icons.calendar_today_outlined, 'Member Since',
              profile.createdAt.split('T').first),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}