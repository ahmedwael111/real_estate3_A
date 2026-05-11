import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: getMediumStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondaryColor,
          ),
        ),
        Text(
          value,
          style: getMediumStyle(
            fontSize: 12.sp,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
