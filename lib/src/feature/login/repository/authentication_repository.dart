import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  // login the user
  Future<UserCredential?> logIn({
    required String email,
    required String password,
  });

  // logout the user
  Future<void> logOut();
}
