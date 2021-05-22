import 'package:base_project/screens/signup/components/body_stepper.dart';
import 'package:base_project/validation/signup_validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignupValidation validationService = Provider.of<SignupValidation>(context);
    return Scaffold(
      // * for transparent appbar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text(""),
          // * for transparent appbar
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.chevron_left_outlined,
                size: 40,
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
