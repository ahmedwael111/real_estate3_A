
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/custom_textformfield.dart';

class SignUp_textFields extends StatelessWidget {
  const SignUp_textFields({
    Key? key,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextformfeild(
          keyboardType: TextInputType.text,
          controller: nameController,
          hintText: "Enter your name",

          labelText: "Name",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Name is required";
            }
            return null;
          },
          formFieldKey: UniqueKey(),
        ),

        SizedBox(height: 16.h),

        CustomTextformfeild(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          hintText: "Enter your email",
          labelText: "Email",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Email is required";
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
          hintText: "password",
          labelText: "Password",
          isPassword: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Password is required";
            }
            if (value.length < 6) {
              return "Password must be at least 6 chars";
            }
            return null;
          },
          formFieldKey: UniqueKey(),
        ),

        SizedBox(height: 16.h),

        CustomTextformfeild(
          keyboardType: TextInputType.visiblePassword,
          controller: phoneController,
          hintText: "confirm password",
          labelText: "confirm password",
          isPassword: true,
          isPhoneField: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Phone is required";
            }
            if (value.length < 10) {
              return "Enter valid phone";
            }
            return null;
          },
          formFieldKey: UniqueKey(),
        ),
      ],
    );
  }
}