
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
const List<Map<String, String>> _kLanguages = [
  {'code': 'en', 'label': 'English', 'flag': '🇺🇸'},
  {'code': 'ar', 'label': 'العربية', 'flag': '🇪🇬'},

];

class LanguageMenuItem extends StatelessWidget {
  const LanguageMenuItem({required this.selectedCode, required this.onTap});
  final String selectedCode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final lang = _kLanguages.firstWhere(
          (l) => l['code'] == selectedCode,
      orElse: () => _kLanguages.first,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              Container(
                width: 42.w,
                height: 42.h,
                decoration: BoxDecoration(
                  color: const Color(0xffB8860B).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(13.r),
                ),
                child: Icon(Icons.language_rounded, color: const Color(0xffB8860B), size: 20.sp),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Language',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkprimarycolor,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'App display language',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              // Language chip
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(lang['flag']!, style: TextStyle(fontSize: 13.sp)),
                    SizedBox(width: 5.w),
                    Text(
                      lang['label']!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color:  const Color(0xFF8B6508),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
