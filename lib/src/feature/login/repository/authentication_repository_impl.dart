import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:memri_example/src/utils/message_text.dart';

import 'authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  late FirebaseAuth _firebaseAuth;

  static final AuthenticationRepositoryImpl _singleton =
      AuthenticationRepositoryImpl._internal();

  factory AuthenticationRepositoryImpl({FirebaseAuth? firebaseAuth}) {
    _singleton._firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

    return _singleton;
  }

  AuthenticationRepositoryImpl._internal();

  @override
  Future<UserCredential?> logIn(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception(Message.weekPassword);
      } else if (e.code == 'email-already-in-use') {
        throw Exception(Message.alreadyExist);
      }
    } catch (e) {
     
      throw Exception(Message.genericErrorMessage);
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      throw Exception(Message.genericErrorMessage);
    }
  }
}
