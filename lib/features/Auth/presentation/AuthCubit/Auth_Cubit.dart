import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repo/AuthRepo.dart';
import 'Auth_state.dart';



class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(
      email: email,
      password: password,
      name: name,
      phone: phone,
    );
    result.fold(
          (failure) => emit(SignUpError(message: failure)),
          (user) => emit(SignUpSuccess()),
    );
  }


  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());

    final result = await authRepo.login(
      email: email,
      password: password,
    );

    result.fold(
          (failure) => emit(SignInError(message: failure)),
          (user) => emit(SignInSuccess()),
    );
  }
}