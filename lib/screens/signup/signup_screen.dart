import 'package:base_project/constants.dart';
import 'package:base_project/screens/signup/components/body_stepper.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * for transparent appbar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "สร้างบัญชีเพื่อเข้าใช้งาน",
          style: appBarStyle,
        ),
        // * for transparent appbar
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BodyStepper(),
    );
  }
}
