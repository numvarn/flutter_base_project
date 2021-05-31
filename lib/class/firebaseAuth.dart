import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  /* 
  * Login by using user & password
  */
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

  /* 
  * Sign up by using username & password
  */
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

  /* 
  * Login with Google 
  */
  Future<User> signInWithGoogle(BuildContext context) async {
    User user;
    String message;

    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await FirebaseAuth.instance.signInWithCredential(credential);

      user = result.user;
      message = 'Now, you log in on ${user.displayName}';
    } on PlatformException catch (e) {
      if (e.code == 'sign_in_canceled') {
        message = 'The user canceled the sign-in flow.';
      }
    } catch (e) {
      message = 'Log-in error';
      print(e.toString());
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

  /*
  * Log in with Facebook
  */
  Future<Map<String, dynamic>> signInWithFacebook(BuildContext context) async {
    String message;
    Map<String, dynamic> userData;

    final LoginResult result = await FacebookAuth.instance.login(); // by default we request the email and the public profile
    if (result.status == LoginStatus.success) {
      userData = await FacebookAuth.instance.getUserData();
      message = 'Log-in success';

      try {
        /*
        * create new firebase auth user
        * if email dose not exist
        */
        final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken.token);
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

        userData = {
          'firstname': userCredential.additionalUserInfo.profile['first_name'],
          'lastname': userCredential.additionalUserInfo.profile['last_name'],
          'email': userCredential.additionalUserInfo.profile['email'],
          'id': userCredential.additionalUserInfo.profile['id'],
        };
      } catch (e) {
        print("This account is already exist with another provider");
        print(userData);
      }
    } else {
      message = 'can not login';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 5),
      ),
    );

    return userData;
  }
}
