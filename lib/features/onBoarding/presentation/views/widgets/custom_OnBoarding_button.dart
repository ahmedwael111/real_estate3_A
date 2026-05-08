
import 'package:flutter/material.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';

class Custom_OnBoarding_Button extends StatelessWidget {
  const Custom_OnBoarding_Button({Key? key, required this.text, required this.onpress,required this.buttonColor})
      : super(key: key);
  final String text;
  final VoidCallback onpress;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 54,
        width: double.infinity,
        child: TextButton(

            style: TextButton.styleFrom(

              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
            ),

            onPressed: onpress, child: Text(text,style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16
        ),)),
      ),
    );
  }
}
