import 'package:base_project/screens/signup/components/account.dart';
import 'package:base_project/screens/signup/components/background.dart';
import 'package:base_project/screens/signup/components/completed_signup.dart';
import 'package:base_project/screens/signup/components/contact.dart';
import 'package:base_project/screens/signup/components/profile.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/validation/signup_validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyStepper extends StatefulWidget {
  @override
  _BodyStepperState createState() => _BodyStepperState();
}

class _BodyStepperState extends State<BodyStepper> {
  int _index = 0;

  bool accountValidate = false;
  bool profileValidate = false;
  bool contactValidate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // * Sign-up validation services
    final validationService = Provider.of<SignupValidation>(context);

    return SingleChildScrollView(
      child: Background(
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _index,
          controlsBuilder: _createEventControlBuilder,
          onStepCancel: () {
            if (_index <= 0) {
              return;
            }
            setState(() {
              _index--;
            });
          },
          onStepContinue: () {
            if (_index > 2) {
              return;
            }

            setState(() {
              if (_index == 0 && validationService.accountIsValid()) {
                accountValidate = true;
                _index++;
              } else if (_index == 1 && validationService.profileIsValid()) {
                profileValidate = true;
                _index++;
              } else if (_index == 2 && validationService.contactIsValid()) {
                contactValidate = true;
                _index++;
              }
            });
          },
          onStepTapped: (index) {
            // Tap for backword step
            if (index == 0 && accountValidate == true) {
              setState(() => _index = index);
            } else if (index == 1 && profileValidate == true) {
              setState(() => _index = index);
            } else if (index == 2 && contactValidate == true) {
              setState(() => _index = index);
            } else if (accountValidate && profileValidate && contactValidate) {
              setState(() => _index = index);
            }
          },
          steps: [
            Step(
              title: Text("บัญชีผู้ใช้งาน"),
              content: Container(
                alignment: Alignment.centerLeft,
                child: AccountForm(),
              ),
              isActive: _index == 0 ? true : false,
              state: _index == 0 ? StepState.editing : StepState.indexed,
            ),
            Step(
              title: Text("ข้อมูลส่วนตัว"),
              content: ProfileForm(),
              isActive: _index == 1 ? true : false,
              state: _index == 1 ? StepState.editing : StepState.indexed,
            ),
            Step(
              title: Text("ข้อมูลติดต่อ"),
              content: ContactForm(),
              isActive: _index == 2 ? true : false,
              state: _index == 2 ? StepState.editing : StepState.indexed,
            ),
            Step(
              title: Text("ยืนยันข้อมูล"),
              content: Container(),
              isActive: _index == 3 ? true : false,
              state: _index == 3 ? StepState.editing : StepState.indexed,
            ),
          ],
        ),
      ),
    );
  }

  // * Submit Data
  void _onSubmitData() {
    String msg = "";
    if (accountValidate && profileValidate && contactValidate) {
      msg = "ทำการสร้างบัญชีผู้ใช้งานแล้ว";
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CompletedSignUp()),
      );
    } else {
      msg = "กรุณากรอกข้อมูลให้ครบถ้วน";
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$msg"),
      duration: Duration(seconds: 5),
    ));
  }

  // * For orverride stepper button
  Widget _createEventControlBuilder(BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: [
              TextButton(
                style: outlineButtonStyle,
                onPressed: onStepCancel,
                child: Text('ย้อนกลับ'),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: <Widget>[
              TextButton(
                style: outlineButtonStyle,
                onPressed: _index == 3 ? _onSubmitData : onStepContinue,
                child: _index == 3 ? Text('ยืนยันข้อมูล') : Text("ต่อไป"),
              )
            ],
          ),
        )
      ],
    );
  }
}
