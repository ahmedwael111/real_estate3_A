import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/funcations/app_functions.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
import 'package:real_estate3_a/core/utils/app_styles.dart';
import 'package:real_estate3_a/features/Auth/presentation/AuthCubit/Auth_Cubit.dart';
import 'package:real_estate3_a/features/Auth/presentation/views/SignUp_view.dart';
import 'package:real_estate3_a/features/Auth/presentation/views/widgets/Auth_Switch_Text.dart';
import 'package:real_estate3_a/features/Auth/presentation/views/widgets/SignIn_TextFields.dart';
import 'package:real_estate3_a/features/Auth/presentation/views/widgets/SocialTextButton.dart';
import 'package:real_estate3_a/generated/assets.dart';

import '../../../../../core/constant/custom_button.dart';
import 'Auth_Divider.dart';
import 'Terms_and_Conditions_Text.dart';
import 'forgot_Password_Text.dart';

class Signinviewbody extends StatefulWidget {
  const Signinviewbody({super.key});

  @override
  State<Signinviewbody> createState() => _SigninviewbodyState();
}

class _SigninviewbodyState extends State<Signinviewbody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Image.asset(Assets.assetsPlashPng),
              Text(
                "Sign In Account",
                style: getMediumStyle(fontSize: 20, color: Colors.black),
              ),
              SignIn_textFields(
                emailController: emailController,
                passwordController: passwordController,
              ),
              forgot_Password_Text(),
              SizedBox(height: 24.h),
              CustomButton(
                data: "Login",
                color: AppColors.splashColor,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    final email = emailController.text;
                    final password = passwordController.text;
                    context.read<AuthCubit>().login(
                      email: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                isLoading: false,
              ),
              SizedBox(height: 24.h),
              Auth_Divider(),
              SizedBox(height: 17.h),
              SocialTextButton(
                onpress: () {},
                title: "Continue with  Google",
                image: Assets.assetsGoogleIcon,
              ),
              SizedBox(height: 16.h),
              SocialTextButton(
                color: Colors.black,
                onpress: () {},
                title: "Continue with Apple",
                image: Assets.assetsAppleIcon,
              ),
              SizedBox(height: 24.h),
              GestureDetector(
                onTap: () => AppFunctions.navigateTo(context, SignupView()),
                child: AuthSwitchText(
                  question: "Don't have an account?",
                  goTo: "Sign Up",
                ),
              ),
              SizedBox(height: 24.h),
              Terms_and_Conditions_Text(),
            ],
          ),
        ),
      ),
    );
  }
}
