
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/custom_textformfield.dart';

class SignIn_textFields extends StatelessWidget {
  const SignIn_textFields({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);


  final TextEditingController emailController;
  final TextEditingController passwordController;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextformfeild(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          hintText: "Enter your email",

          labelText: "email",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "email is required";
            }
            if (!value.contains("@")) {
              return "Enter valid email";
            }
            return null;
          },
          formFieldKey: UniqueKey(),
        ),

        SizedBox(height: 16.h),

        CustomTextformfeild(
          keyboardType: TextInputType.visiblePassword,
          controller: passwordController,
          hintText: "Enter your password",
          labelText: "password",
          isPassword: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Email is required";
            }

            return null;
          },
          formFieldKey: UniqueKey(),
        ),

        SizedBox(height: 16.h),


      ],
    );
  }
}