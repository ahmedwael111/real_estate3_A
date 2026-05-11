import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/choose_payment_screen.dart';
import 'booking_details_summary_section.dart';
import 'booking_information_success_section.dart';
import 'card_details_section.dart';
import 'custom_divider.dart';
import 'insurance_section.dart';
import 'payment_method_section.dart';
import 'price_details_section.dart';
import 'section_headline.dart';
import 'terms_cancellation_section.dart';

class PaymentDetailsStepView extends StatelessWidget {
  const PaymentDetailsStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeadline(title: 'Insurancee'),
        const InsuranceSection(),
        const CustomDivider(),
        
        const SectionHeadline(title: 'Payment Method'),
        PaymentMethodSection(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const ChoosePaymentScreen()));
        }),
        const CustomDivider(),

        const SectionHeadline(title: 'Booking Information'),
        const BookingInformationSuccessSection(),
        const CustomDivider(),

        const SectionHeadline(title: 'Booking Details'),
        const BookingDetailsSummarySection(),
        const CustomDivider(),
        
        const SectionHeadline(title: 'Price details'),
        const PriceDetailsSection(),
        const CustomDivider(),
        
        const SectionHeadline(title: 'Payment Details'),
        const CardDetailsSection(),
        const CustomDivider(),
        const TermsCancellationSection(),
        SizedBox(height: 32.h),
      ],
    );
  }
}
