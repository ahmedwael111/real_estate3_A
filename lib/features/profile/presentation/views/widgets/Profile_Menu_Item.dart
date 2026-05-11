import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';

// ── Theme colors ──────────────────────────────────────────────────────────────
const Color _primary = Color(0xFF1597A8); // teal (replaces 0xffB8860B)

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Color iconColor;
  final Color titleColor;
  final bool showArrow;
  final bool isLoading;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.iconColor = _primary, // was Color(0xffB8860B)
    this.titleColor = const Color(0xff1A1A2E),
    this.showArrow = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(icon, color: iconColor, size: 20.sp),
              ),
              SizedBox(width: 14.w),

              // ── Text ─────────────────────────────────────────────────
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),

              // ── Trailing ─────────────────────────────────────────────
              if (isLoading)
                SizedBox(
                  width: 18.w,
                  height: 18.h,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: iconColor,
                  ),
                )
              else if (showArrow)
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14.sp,
                  color: Colors.grey[400],
                ),
            ],
          ),
        ),
      ),
    );
  }
}