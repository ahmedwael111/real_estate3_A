
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/home_test.dart';

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
          AppFunctions.navigateTo(context, HomeViewTest());
        } else if (state is SignInError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message!)));
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: state is SignInLoading ? true : false,
        child: Signinviewbody(),
      ),
    );
  }
}