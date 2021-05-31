import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/constants.dart';
import '/screens/signup/components/body_stepper.dart';
import '/validation/signup_validation.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignupValidation validationService = Provider.of<SignupValidation>(context);
    return Scaffold(
      // * for transparent appbar
      extendBodyBehindAppBar: false,
      appBar: AppBar(
          title: Text(
            "Sign-up",
            style: appBarStyle,
          ),
          // * for transparent appbar
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.chevron_left_outlined,
                size: 40,
                color: kPrimaryColor,
              ),
              onPressed: () {
                validationService.setIndexBySlider(0);
                Navigator.pop(context);
              },
            );
          })),
      body: BodyStepper(),
    );
  }
}
