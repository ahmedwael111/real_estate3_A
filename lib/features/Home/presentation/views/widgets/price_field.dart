
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const PriceField({required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 13.sp,
            color: const Color(0xFF9CA3AF),
          ),
          border: InputBorder.none,
          isDense: true,
        ),
        style: TextStyle(
          fontSize: 13.sp,
          color: const Color(0xFF1A1A2E),
        ),
      ),
    );
  }
}