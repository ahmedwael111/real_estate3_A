
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.iconColor = const Color(0xFF1597A8),
    this.isLoading = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Color iconColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(18.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              Container(
                width: 42.w,
                height: 42.h,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(13.r),
                ),
                child: Icon(icon, color: iconColor, size: 20.sp),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkprimarycolor,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              if (isLoading)
                SizedBox(
                  width: 18.w,
                  height: 18.h,
                  child: CircularProgressIndicator(strokeWidth: 2, color: iconColor),
                )
              else
                Icon(Icons.arrow_forward_ios_rounded, size: 14.sp, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
