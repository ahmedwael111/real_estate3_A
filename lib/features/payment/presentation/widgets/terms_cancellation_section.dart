import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class TermsCancellationSection extends StatefulWidget {
  const TermsCancellationSection({super.key});

  @override
  State<TermsCancellationSection> createState() => _TermsCancellationSectionState();
}

class _TermsCancellationSectionState extends State<TermsCancellationSection> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.errorColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(Icons.error_outline, color: AppColors.errorColor, size: 24.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cancellation Policy',
                      style: getMediumStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'At Dzawani, we understand that plans can change suddenly. That\'s why we have designed our...',
                      style: getRegularStyle(
                        fontSize: 12.sp,
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
                activeColor: AppColors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                side: BorderSide(color: AppColors.teal, width: 2),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: getMediumStyle(fontSize: 12.sp, color: AppColors.black),
                  children: [
                    const TextSpan(text: 'By clicking this, I agree to the '),
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: getMediumStyle(fontSize: 12.sp, color: AppColors.teal),
                    ),
                    const TextSpan(text: ' and the '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: getMediumStyle(fontSize: 12.sp, color: AppColors.teal),
                    ),
                    const TextSpan(text: ' of HabiSpace.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
