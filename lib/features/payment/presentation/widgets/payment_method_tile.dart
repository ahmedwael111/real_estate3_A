import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PaymentMethodTile extends StatelessWidget {
  final int index;
  final String title;
  final List<String> logos;
  final int selectedMethod;
  final ValueChanged<int> onTap;

  const PaymentMethodTile({
    super.key,
    required this.index,
    required this.title,
    required this.logos,
    required this.selectedMethod,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedMethod == index;
    return InkWell(
      onTap: () => onTap(index),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Row(
          children: [
            Text(
              title,
              style: getMediumStyle(
                fontSize: 14.sp,
                color: AppColors.black,
              ),
            ),
            const Spacer(),
            ...logos.map((logo) => Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Text(
                logo,
                style: getBoldStyle(
                  fontSize: 10.sp,
                  color: AppColors.primaryColor,
                ).copyWith(fontStyle: FontStyle.italic),
              ),
            )),
            SizedBox(width: 8.w),
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.teal : AppColors.grey,
                  width: isSelected ? 6.w : 1.5.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
