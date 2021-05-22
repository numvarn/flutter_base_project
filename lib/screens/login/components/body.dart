import 'package:base_project/components/dialog_alert.dart';
import 'package:base_project/components/dialog_confirm.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/screens/operations/operations_screen.dart';
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
            /* SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ), */
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
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return CustomConfirmDialog(
                        title: "กำลังดำเนินการเข้าสู่ระบบ",
                        subtitle: "ต้องการดำเนินการต่อกรุณากดปุ่มยืนยัน",
                        onpress: () {
                          print("Processing");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OperationScreen()),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return showDialog(
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
