
import 'package:flutter/material.dart';
import 'package:real_estate3_a/core/constant/custom_app_bar.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
import 'package:real_estate3_a/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body:SplashViewBody() ,
    );
  }
}
