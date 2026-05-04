import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/custom_app_bar.dart';
import '../../../../core/constant/custom_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/custom_divider.dart';
import '../widgets/payment_method_tile.dart';

class ChoosePaymentScreen extends StatefulWidget {
  const ChoosePaymentScreen({super.key});

  @override
  State<ChoosePaymentScreen> createState() => _ChoosePaymentScreenState();
}

class _ChoosePaymentScreenState extends State<ChoosePaymentScreen> {
  int _selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(title: 'Choose Payment'),
      body: Column(
        children: [
          const CustomDivider(),
          PaymentMethodTile(
            index: 0,
            title: 'Credit Card/Debit',
            logos: const ['VISA', 'MASTER'],
            selectedMethod: _selectedMethod,
            onTap: (index) => setState(() => _selectedMethod = index),
          ),
          const CustomDivider(),
          PaymentMethodTile(
            index: 1,
            title: 'Mobile Banking',
            logos: const ['BANK'],
            selectedMethod: _selectedMethod,
            onTap: (index) => setState(() => _selectedMethod = index),
          ),
          const CustomDivider(),
        ],
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
        child: CustomButton(
          data: 'Select Payment Method',
          color: AppColors.teal,
          bordercolor: AppColors.teal,
          fontSize: 14.sp,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
