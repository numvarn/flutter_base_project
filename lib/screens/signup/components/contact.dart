import 'package:base_project/class/firebaseAuth.dart';
import 'package:base_project/components/rounded_input_field.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/screens/signup/components/completed_signup.dart';
import 'package:base_project/validation/signup_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ContactForm extends StatefulWidget {
  @override
  ContactFormState createState() {
    return ContactFormState();
  }
}

class ContactFormState extends State<ContactForm> {
  SignupValidation validationService;

  static TextEditingController addressController = new TextEditingController();
  static TextEditingController mobileController = new TextEditingController();

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  // * mark text form field
  var maskPhoneFormatter = new MaskTextInputFormatter(mask: '###-###-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    // * Sign-up validation services
    validationService = Provider.of<SignupValidation>(context);
    Size size = MediaQuery.of(context).size;

    /*
    * Login button
    */
    final _submitButton = RoundedLoadingButton(
      child: Text(
        "ลงทะเบียนผู้ใช้",
        textAlign: TextAlign.center,
        style: TextStyle(color: kPrimaryColor),
      ),
      controller: _btnController,
      elevation: 0,
      width: MediaQuery.of(context).size.width,
      color: kPrimaryLightColor,
      onPressed: () {
        _validateDataForm();
      },
    );

    return Container(
      width: size.width * .8,
      child: Form(
        child: Column(
          children: [
            RoundedInputField(
              hintText: "เบอร์โทรติดต่อ",
              errorText: validationService.phone.error,
              icon: Icons.phone_outlined,
              controller: mobileController,
              keyboardType: TextInputType.number,
              inputFormatters: [maskPhoneFormatter],
              onChanged: (value) {
                validationService.validatePhone(value);
              },
            ),
            RoundedInputField(
              hintText: "ที่อยู่",
              errorText: validationService.address.error,
              minLines: 5,
              maxLines: 7,
              icon: Icons.home_outlined,
              controller: addressController,
              onChanged: (value) {
                validationService.validateAddress(value);
              },
            ),
            SizedBox(
              height: 10,
            ),
            _submitButton,
          ],
        ),
      ),
    );
  }

  void _validateDataForm() {
    if (!validationService.accountIsValid()) {
      validationService.setIndex(0);
      _btnController.stop();
    } else if (!validationService.profileIsValid()) {
      validationService.setIndex(1);
      _btnController.stop();
    } else if (validationService.contactIsValid()) {
      _onSubmitData();
    }
  }

  /* void _onSubmitConfirm() {
    String msg = "สร้างรายชื่อผู้ใช้งานเรียบร้อย";
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CompletedSignUp()),
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$msg"),
      duration: Duration(seconds: 5),
    ));
  } */

  void _onSubmitData() {
    Map<String, dynamic> data = {
      'email': validationService.email.value,
      'password': validationService.password.value,
      'gender': validationService.gender,
      'firstname': validationService.firstname.value,
      'lastname': validationService.lastname.value,
      'dob': validationService.dob.value,
      'phone': validationService.phone.value,
      'address': validationService.address.value,
    };

    /*
    * Print all register state
    */
    print(data);

    /*
    * Register new user to firebase auth
    */
    _registerUserOnFirebase(validationService.email.value, validationService.password.value);
  }

  /*
  * Register new user to firebase auth
  */
  void _registerUserOnFirebase(email, password) {
    var authHandler = new Auth();
    authHandler.handleSignUp(context, email, password).then((User user) {
      if (user != null) {
        _btnController.success();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompletedSignUp()),
        );
      } else {
        print("error");
        _btnController.stop();
      }
    });
  }
}
