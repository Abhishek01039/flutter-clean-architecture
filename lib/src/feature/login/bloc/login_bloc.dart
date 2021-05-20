import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memri_example/src/feature/login/repository/authentication_repository.dart';
import 'package:memri_example/src/utils/message_text.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })   : _authenticationRepository = authenticationRepository,
        super(LoginInitialState());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginRequest) {
      yield LoginLoadingState();
      try {
        final UserCredential? session = await _authenticationRepository.logIn(
            email: event.email, password: event.password);

        if (session == null) {
          // if session is null then thows an error.
          throw Exception(Message.genericLoginErrorMessage);
        } else {
          yield LoginSuccessState(
            email: session.user?.email,
          );
        }
      } catch (e) {
        yield LoginErrorState(errorMessage: e.toString());
      }
    } else if (event is LogoutRequested) {
      yield LogoutLoadingState();
      try {
        await _authenticationRepository.logOut();

        yield LogoutSuccess();
      } catch (e) {
        yield LogoutError(errorMessage: e.toString());
      }
    } else if (event is LoginPassShowRequested) {
      yield LoginPassShowState();
    } else if (event is LoginPassHideRequested) {
      yield LoginPassHideState();
    }
  }
}
