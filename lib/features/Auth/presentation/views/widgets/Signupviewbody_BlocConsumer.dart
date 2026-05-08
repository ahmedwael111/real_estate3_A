
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../AuthCubit/Auth_Cubit.dart';
import '../../AuthCubit/Auth_state.dart';
import 'SignUpViewBody.dart';

class Signupviewbody_BlocConsumer extends StatelessWidget {
  const Signupviewbody_BlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
        listener: (context, state) {

          if(state is SignUpSuccess){
            Navigator.pop(context);
          }        if(state is SignUpError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message!)));
          }

        },
        builder: (context, state) =>
            ModalProgressHUD(
                inAsyncCall: state is SignUpLoading ?true :false,
                child: Signupviewbody()));
  }
}
