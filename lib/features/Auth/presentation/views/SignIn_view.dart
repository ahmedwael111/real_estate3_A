import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:real_estate3_a/core/di.dart';
import 'package:real_estate3_a/core/funcations/app_functions.dart';
import 'package:real_estate3_a/features/Auth/data/repo/AuthRepoImp.dart';
import 'package:real_estate3_a/features/Auth/presentation/AuthCubit/Auth_Cubit.dart';
import 'package:real_estate3_a/features/Auth/presentation/AuthCubit/Auth_state.dart';
import 'package:real_estate3_a/features/Auth/presentation/views/widgets/SignInViewBody.dart';
import 'package:real_estate3_a/features/Home/presentation/views/Home_view.dart';

class SigninView extends StatelessWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(authRepo: getIt.get<AuthRepoImpl>()),
        child: SignInBody_BlocConsumer(),
      ),
    );
  }
}

class SignInBody_BlocConsumer extends StatelessWidget {
  const SignInBody_BlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          AppFunctions.navigateTo(context, HomeView());
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
