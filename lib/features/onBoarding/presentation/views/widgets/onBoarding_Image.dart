
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/assets.dart';

class onBoarding_Image extends StatelessWidget {
  const onBoarding_Image({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.73.h,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        child: Image.asset(
          Assets.assetsOnBoardingImgg,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}