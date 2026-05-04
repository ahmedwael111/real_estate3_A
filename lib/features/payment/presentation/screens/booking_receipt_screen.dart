import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/custom_app_bar.dart';
import '../../../../core/constant/custom_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../widgets/custom_divider.dart';
import '../widgets/receipt_row.dart';

class BookingReceiptScreen extends StatelessWidget {
  const BookingReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(title: 'Booking Receipt'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: const BoxDecoration(
                color: AppColors.lightGreenBg,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check_circle, color: AppColors.darkGreenText, size: 40.sp),
            ),
            SizedBox(height: 24.h),
            Text(
              '\$120.250',
              style: getBoldStyle(fontSize: 32.sp, color: AppColors.black),
            ),
            SizedBox(height: 8.h),
            Text(
              'Payment Successful!',
              style: getMediumStyle(fontSize: 16.sp, color: AppColors.black),
            ),
            SizedBox(height: 32.h),
            const CustomDivider(),
            SizedBox(height: 24.h),
            const ReceiptRow(label: 'Account Number', value: '2618085752257', isBoldValue: true),
            SizedBox(height: 16.h),
            const ReceiptRow(label: 'Payment Date', value: 'Sept 9, 2025, 09:41:13', isBoldValue: true),
            SizedBox(height: 16.h),
            const ReceiptRow(label: 'Payment Method', value: 'Bank Transfer', isBoldValue: true),
            SizedBox(height: 16.h),
            const ReceiptRow(label: 'Sender\'s Name', value: 'Wade Warren', isBoldValue: true),
            SizedBox(height: 24.h),
            const CustomDivider(),
            SizedBox(height: 24.h),
            const ReceiptRow(label: 'House Prices', value: '\$120.000', isBoldValue: true),
            SizedBox(height: 16.h),
            const ReceiptRow(label: 'HabiSpace service fee', value: '\$250', isBoldValue: true),
            SizedBox(height: 24.h),
            const CustomDivider(),
            SizedBox(height: 24.h),
            const ReceiptRow(label: 'Real Estate', value: 'SunnySlade House', isBoldValue: true),
            SizedBox(height: 16.h),
            const ReceiptRow(label: 'Book Appointment', value: '12 Sept 2025 - 09.00', isBoldValue: true),
            SizedBox(height: 40.h),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 32.h, top: 16.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              data: 'Download Receipt',
              color: AppColors.blue.withValues(alpha: 0.1), 
              txtcolor: AppColors.teal,
              bordercolor: Colors.transparent,
              fontSize: 14.sp,
              icon2: Icon(Icons.picture_as_pdf_outlined, color: AppColors.teal, size: 20.sp),
              onTap: () {},
            ),
            SizedBox(height: 12.h),
            CustomButton(
              data: 'Return to Home',
              color: AppColors.teal,
              bordercolor: AppColors.teal,
              fontSize: 14.sp,
              txtcolor: AppColors.white,
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
