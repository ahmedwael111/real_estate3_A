

sealed class AuthState {}

final class SignUpInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpError extends AuthState {
final String? message;
SignUpError({required this.message});
}

final class SignInInitial extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {}

final class SignInError extends AuthState {
final String? message;
SignInError({required this.message});
}