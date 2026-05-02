
import 'package:flutter/material.dart';

import '../../../../../core/funcations/app_functions.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../SignIn_view.dart';

class AuthSwitchText extends StatelessWidget {
  const AuthSwitchText({
    super.key,required this.question,required this.goTo
  });
final String question,goTo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: getRegularStyle(fontSize: 12, color: Colors.black),
        ),
        Text(
          goTo,
          style: getRegularStyle(fontSize: 12, color:AppColors.splashColor),
        ),
      ],);
  }
}