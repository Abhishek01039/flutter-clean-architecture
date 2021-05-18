part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class SocialLoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  const LoginErrorState({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState({this.email});

  final String? email;

  LoginSuccessState copyWith({
    String? email,
  }) {
    return LoginSuccessState(
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [email];
}

class Logout extends LoginState {}

class LogoutLoadingState extends LoginState {}

class LogoutSuccess extends LoginState {}

class LogoutError extends LoginState {
  const LogoutError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class LoginPassShowState extends LoginState {}

class LoginPassHideState extends LoginState {}
