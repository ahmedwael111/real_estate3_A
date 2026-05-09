import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_stepper/easy_stepper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PaymentStepper extends StatelessWidget {
  final int currentStep;
  const PaymentStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: EasyStepper(
        activeStep: currentStep,
        activeStepTextColor: AppColors.teal,
        finishedStepTextColor: AppColors.black,
        unreachedStepTextColor: AppColors.textSecondaryColor,
        internalPadding: 0,
        showLoadingAnimation: false,
        stepRadius: 12.r,
        showStepBorder: false,
        steps: [
          EasyStep(
            customStep: _buildStepIcon('1', currentStep >= 0, context),
            title: 'Review Data',
          ),
          EasyStep(
            customStep: _buildStepIcon('2', currentStep >= 1, context),
            title: 'Payment Details',
          ),
          EasyStep(
            customStep: _buildStepIcon('3', currentStep >= 2, context),
            title: 'Done',
          ),
        ],
      ),
    );
  }

  Widget _buildStepIcon(String number, bool isActive, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? AppColors.teal : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? AppColors.teal : AppColors.black,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          number,
          style: getMediumStyle(
            fontSize: 12.sp,
            color: isActive ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}
