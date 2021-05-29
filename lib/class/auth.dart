import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> handleSignInEmail(BuildContext context, String email, String password) async {
    User user;
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = result.user;
    } on Exception catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return user;
  }

  Future<User> handleSignUp(email, password) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    final User user = result.user;

    return user;
  }
}
