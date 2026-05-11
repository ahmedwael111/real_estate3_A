import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';

// ── Theme colors ──────────────────────────────────────────────────────────────
const Color _primary = Color(0xFF1597A8); // teal (replaces 0xffB8860B)

class ToggleMenuItem extends StatelessWidget {
  const ToggleMenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        children: [
          Container(
            width: 42.w,
            height: 42.h,
            decoration: BoxDecoration(
              color: _primary.withOpacity(0.1), // was Color(0xffB8860B).withOpacity(0.1)
              borderRadius: BorderRadius.circular(13.r),
            ),
            child: Icon(icon, color: _primary, size: 20.sp), // was Color(0xffB8860B)
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
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: _primary, // was Color(0xffB8860B).withOpacity(0.5)
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade300,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}