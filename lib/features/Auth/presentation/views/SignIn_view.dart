import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/core/di.dart';
import 'package:real_estate3_a/features/Auth/data/repo/AuthRepoImp.dart';
import 'package:real_estate3_a/features/Auth/presentation/AuthCubit/Auth_Cubit.dart';
import 'package:real_estate3_a/features/Auth/presentation/views/widgets/SignInBody_BlocConsumer.dart';

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
