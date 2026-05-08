
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
const List<Map<String, String>> _kLanguages = [
  {'code': 'en', 'label': 'English', 'flag': '🇺🇸'},
  {'code': 'ar', 'label': 'العربية', 'flag': '🇪🇬'},

];

class LanguageSheet extends StatelessWidget {
  const LanguageSheet({required this.selectedCode, required this.onSelect});
  final String selectedCode;
  final ValueChanged<String> onSelect;

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
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4.r)),
            ),
          ),
          SizedBox(height: 20.h),
          Text('Select Language',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkprimarycolor)),
          SizedBox(height: 16.h),
          ..._kLanguages.map((lang) {
            final isSelected = lang['code'] == selectedCode;
            return GestureDetector(
              onTap: () => onSelect(lang['code']!),
              child: Container(
                margin: EdgeInsets.only(bottom: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.lightprimarycolor : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: isSelected ? AppColors.splashColor : Colors.grey.shade200,
                    width: isSelected ? 1.5 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Text(lang['flag']!, style: TextStyle(fontSize: 22.sp)),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Text(
                        lang['label']!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? AppColors.splashColor : AppColors.darkprimarycolor,
                        ),
                      ),
                    ),
                    if (isSelected)
                      Icon(Icons.check_circle_rounded,
                          color: AppColors.splashColor, size: 20.sp),
                  ],
                ),
              ),
            );
          }),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
