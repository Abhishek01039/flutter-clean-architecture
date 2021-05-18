part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequest extends LoginEvent {
  const LoginRequest({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class LogoutRequested extends LoginEvent {}

class LoginPassShowRequested extends LoginEvent {}

class LoginPassHideRequested extends LoginEvent {}
