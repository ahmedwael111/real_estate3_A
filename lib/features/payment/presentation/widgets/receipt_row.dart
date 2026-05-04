import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ReceiptRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBoldValue;

  const ReceiptRow({
    super.key,
    required this.label,
    required this.value,
    this.isBoldValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: getRegularStyle(fontSize: 14.sp, color: AppColors.textSecondaryColor),
        ),
        Text(
          value,
          style: isBoldValue 
              ? getBoldStyle(fontSize: 14.sp, color: AppColors.black)
              : getMediumStyle(fontSize: 14.sp, color: AppColors.black),
        ),
      ],
    );
  }
}
