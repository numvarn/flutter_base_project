import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> handleSignInEmail(BuildContext context, String email, String password) async {
    User user;
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = result.user;
    } on FirebaseAuthException catch (e) {
      String errorMsg = "";
      if (e.code == 'user-not-found') {
        errorMsg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMsg = 'Wrong password provided for that user.';
      }

      final snackBar = SnackBar(content: Text(errorMsg));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return user;
  }

  Future<User> handleSignUp(BuildContext context, email, password) async {
    User user;
    String message = "";
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      user = result.user;
      message = 'สร้างรายชื่อผู้ใช้งานเรียบร้อย';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
    } catch (e) {
      message = e.toString();
    }

    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
    return user;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
