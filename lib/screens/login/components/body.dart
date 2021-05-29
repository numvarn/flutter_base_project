import 'package:base_project/class/auth.dart';
import 'package:base_project/components/dialog_alert.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/screens/operations/operations_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:base_project/screens/login/components/background.dart';
import 'package:base_project/screens/signup/signup_screen.dart';
import 'package:base_project/components/already_have_an_account_acheck.dart';
import 'package:base_project/components/rounded_button.dart';
import 'package:base_project/components/rounded_input_field.dart';
import 'package:base_project/components/rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _signInWithEmailAndPassword(email, password) {
    var authHandler = new Auth();

    authHandler.handleSignInEmail(email, password).then((User user) {
      if (user != null) {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new OperationScreen()),
        );
      }
    }).catchError((e) {
      final snackBar = SnackBar(content: Text(e.message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    String emailField = "";
    String passwordField = "";

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "เข้าสู่ระบบเพื่อใช้งาน",
              style: appBarStyle,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "อีเมล",
              onChanged: (value) {
                emailField = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                passwordField = value;
              },
            ),
            RoundedButton(
              text: "เข้าสู่ระบบ",
              press: () {
                if (emailField.isNotEmpty && passwordField.isNotEmpty) {
                  _signInWithEmailAndPassword(emailField, passwordField);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDialog(
                        title: "ข้อมูลไม่ถูกต้อง",
                        subtitle: "กรุณาตรวจสอบข้อมูลอีกครั้ง",
                        onpress: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
