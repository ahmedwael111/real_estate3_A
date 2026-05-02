
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class forgot_Password_Text extends StatelessWidget {
  const forgot_Password_Text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Forgot password?",
          style: getRegularStyle(
            fontSize: 12.sp,
            color: AppColors.splashColor,
          ),
        ),
      ],
    );
  }
}