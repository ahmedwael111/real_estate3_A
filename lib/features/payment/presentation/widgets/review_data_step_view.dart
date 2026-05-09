import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'add_on_section.dart';
import 'custom_divider.dart';
import 'resident_data_section.dart';
import 'section_headline.dart';

class ReviewDataStepView extends StatelessWidget {
  const ReviewDataStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeadline(title: 'Resident Data'),
        const ResidentDataSection(),
        const CustomDivider(),
        
        const SectionHeadline(title: 'Add-On'),
        const AddOnSection(),
        SizedBox(height: 32.h),
      ],
    );
  }
}
