import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'booking_detail_section.dart';
import 'cancellation_policy_section.dart';
import 'custom_divider.dart';
import 'price_details_section.dart';
import 'section_headline.dart';

class RequestToBookStepView extends StatelessWidget {
  const RequestToBookStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeadline(title: 'Booking Detail'),
        const BookingDetailSection(),
        const CustomDivider(),
        
        const SectionHeadline(title: 'Price details'),
        const PriceDetailsSection(),
        const CustomDivider(),
        
        const SectionHeadline(title: 'Cancellation Policy'),
        const CancellationPolicySection(),
        SizedBox(height: 32.h),
      ],
    );
  }
}
