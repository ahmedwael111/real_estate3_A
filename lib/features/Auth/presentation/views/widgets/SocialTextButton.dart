
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
import 'package:real_estate3_a/core/utils/app_styles.dart';

class SocialTextButton extends StatelessWidget {
  const SocialTextButton({
    Key? key,
    required this.onpress,
    required this.title,
    required this.image,
    this.color
  }) : super(key: key);

  final VoidCallback onpress;
  final String title;
  final String image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        onPressed: onpress,
        style: TextButton.styleFrom(
          backgroundColor:color ??Color(0xffEBEBEB),
            shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Color(0xffDDDFDF),)
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

             SvgPicture.asset(image) ,
             SizedBox(width: 13.w,),
             Text(title,style:getMediumStyle(fontSize: 16, color: AppColors.grey),textAlign: TextAlign.center,),

          ],
        ),
      ),
    );
  }
}