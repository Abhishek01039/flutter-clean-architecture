import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    add(SplashInitialEvent());
  }

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is SplashInitialEvent) {
      if (FirebaseAuth.instance.currentUser?.email != null) {
        // User is authenticated
        yield UserAuthenticated();
      } else {
        // User is not authenticated
        yield UserNotAuthenticated();
      }
    }
  }
}
