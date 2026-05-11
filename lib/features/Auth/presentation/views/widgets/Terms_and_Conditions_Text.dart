import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class Terms_and_Conditions_Text extends StatelessWidget {
  const Terms_and_Conditions_Text({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "By signing in, you agree to our ",
              style: getRegularStyle(fontSize: 12, color: Colors.black),
            ),
            Text(
              "Terms and Conditions",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: getRegularStyle(
                fontSize: 11,
                color: AppColors.splashColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " Learn how we use your data",
              style: getRegularStyle(fontSize: 12, color: Colors.black),
            ),
            Text(
              " in our Privacy Policy.",
              style: getRegularStyle(
                fontSize: 12,
                color: AppColors.splashColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
