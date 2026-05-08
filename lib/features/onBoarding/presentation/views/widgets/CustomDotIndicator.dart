
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:real_estate3_a/core/utils/app_colors.dart';

  class CustomDotIndicator extends StatelessWidget {
    const CustomDotIndicator({Key? key, required this.isActive})
        : super(key: key);
    final bool isActive;
    @override
    Widget build(BuildContext context) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isActive ? 40.w : 40.w,
        height: 8.h,
        decoration: ShapeDecoration(
          color: isActive ? AppColors.splashColor : Color(0xffD1D1D1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        ),
      );
    }
  }
