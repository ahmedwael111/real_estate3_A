
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class Auth_Divider extends StatelessWidget {
  const Auth_Divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: Divider(height: 1.5, color: AppColors.grey, thickness: 1.5)),
      SizedBox(width: 8,),
      Text(
        "or login with",
        style: getRegularStyle(fontSize: 12.sp, color: AppColors.splashColor),
      ),
      SizedBox(width: 8,),
      Expanded(child: Divider(height: 1.5, color: AppColors.grey, thickness: 1.5)),
    ],);
  }
}
