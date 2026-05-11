import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'summary_row.dart';

class BookingDetailsSummarySection extends StatelessWidget {
  const BookingDetailsSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SummaryRow(label: 'Real Estate', value: 'SunnySlade House'),
        SizedBox(height: 16.h),
        const SummaryRow(label: 'Location', value: 'Beverly Hills, CA'),
        SizedBox(height: 16.h),
        const SummaryRow(label: 'Book Appointment', value: '12 Sept 2025 - 09.00'),
        SizedBox(height: 16.h),
        const SummaryRow(label: 'Payment Option', value: 'Bank Transfer'),
      ],
    );
  }
}
