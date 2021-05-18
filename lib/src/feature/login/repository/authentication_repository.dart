import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<UserCredential?> logIn({
    required String email,
    required String password,
  });

  Future<UserCredential?> signIn({
    required String email,
    required String password,
  });

  // logout the user
  Future<void> logOut();
}
