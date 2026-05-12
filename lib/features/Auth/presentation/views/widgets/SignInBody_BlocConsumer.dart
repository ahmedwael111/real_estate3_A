import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
import 'package:real_estate3_a/features/Home/presentation/views/MainView.dart';

import '../../../../../core/funcations/app_functions.dart';
import '../../AuthCubit/Auth_Cubit.dart';
import '../../AuthCubit/Auth_state.dart';
import 'SignInViewBody.dart';

class SignInBody_BlocConsumer extends StatelessWidget {
  const SignInBody_BlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainView()),
            (route) => false,
          );
        } else if (state is SignInError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message!)));
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: state is SignInLoading ? true : false,
        color: AppColors.splashColor,
        child: Signinviewbody(),
      ),
    );
  }
}
