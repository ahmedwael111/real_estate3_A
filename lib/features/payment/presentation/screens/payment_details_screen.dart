import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/custom_app_bar.dart';
import '../../../../core/constant/custom_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/booking_summary_card.dart';
import '../widgets/custom_divider.dart';
import '../widgets/payment_stepper.dart';
import '../widgets/request_to_book_step_view.dart';
import '../widgets/review_data_step_view.dart';
import '../widgets/payment_details_step_view.dart';
import 'booking_receipt_screen.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  int _currentStep = 0;

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    } else {    
       Navigator.push(context, MaterialPageRoute(builder: (_) => const BookingReceiptScreen()));
    }
  }

  String getButtonText() {
    if (_currentStep == 0) return 'Next: Review Data';
    if (_currentStep == 1) return 'Next: Payment Details';
    return 'Finish Payment';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: _currentStep == 0 ? 'Request to Book' : 'Booking Detail',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_currentStep >= 1) ...[
              PaymentStepper(currentStep: _currentStep - 1),
              const CustomDivider(),
            ],
            
            if (_currentStep < 3) ...[
              const BookingSummaryCard(),
              const CustomDivider(),
            ],
            
            if (_currentStep == 0)
              const RequestToBookStepView()
            else if (_currentStep == 1)
              const ReviewDataStepView()
            else if (_currentStep == 2)
              const PaymentDetailsStepView(),
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
        child: CustomButton(
          data: getButtonText(),
          color: AppColors.teal,
          bordercolor: AppColors.teal,
          onTap: _nextStep,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
