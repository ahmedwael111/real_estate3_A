import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/constant/custom_button.dart';
import 'package:real_estate3_a/core/constant/custom_textformfield.dart';
import 'package:real_estate3_a/core/funcations/app_functions.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
import 'package:real_estate3_a/core/utils/app_styles.dart';
import 'package:real_estate3_a/features/Auth/presentation/AuthCubit/Auth_Cubit.dart';
import 'package:real_estate3_a/features/Auth/presentation/views/SignIn_view.dart';
import 'package:real_estate3_a/generated/assets.dart';

import 'Auth_Switch_Text.dart';
import 'SignUp_textFields.dart';

class Signupviewbody extends StatefulWidget {
  const Signupviewbody({Key? key}) : super(key: key);

  @override
  State<Signupviewbody> createState() => _SignupviewbodyState();
}

class _SignupviewbodyState extends State<Signupviewbody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Image.asset(Assets.assetsPlashPng),
              SizedBox(height: 29.h),
              Text(
                "Sign Up Account",
                style: getMediumStyle(fontSize: 20, color: Colors.black),
              ),
              SignUp_textFields(
                emailController: emailController,
                nameController: nameController,
                passwordController: passwordController,
                phoneController: phoneController,
              ),

              SizedBox(height: 30.h),

              CustomButton(
                data: "Register",
                color: AppColors.splashColor,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    final name = nameController.text;
                    final email = emailController.text;
                    final password = passwordController.text;
                    final phone = phoneController.text;
                   context.read<AuthCubit>().signUp(email: email, password: password, name: name, phone: phone);

                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                isLoading: false,
              ),
              SizedBox(height: 24.h),
              GestureDetector(
                  onTap: () => AppFunctions.navigateTo(context, SigninView()),
                  child: AuthSwitchText(question: "have an account?" ,goTo: "Sign In",)),
            ],
          ),
        ),
      ),
    );
  }
}
