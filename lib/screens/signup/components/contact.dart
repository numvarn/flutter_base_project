import 'package:base_project/components/dialog_confirm.dart';
import 'package:base_project/components/rounded_input_field.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/screens/signup/components/completed_signup.dart';
import 'package:base_project/validation/signup_validation.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

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

  // * mark text form field
  var maskPhoneFormatter = new MaskTextInputFormatter(mask: '###-###-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    // * Sign-up validation services
    validationService = Provider.of<SignupValidation>(context);
    Size size = MediaQuery.of(context).size;

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
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  _validateDataForm();
                },
                child: Text("ลงทะเบียนผู้ใช้งานใหม่"),
                style: outlineCurveStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _validateDataForm() {
    if (!validationService.accountIsValid()) {
      validationService.setIndex(0);
    } else if (!validationService.profileIsValid()) {
      validationService.setIndex(1);
    } else if (validationService.contactIsValid()) {
      _onSubmitData();
    }
  }

  void _onSubmitConfirm() {
    String msg = "";
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CompletedSignUp()),
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$msg"),
      duration: Duration(seconds: 5),
    ));
  }

  void _onSubmitData() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomConfirmDialog(
          title: "ดำเนินการสร้างบัญชีผู้ใช้",
          subtitle: "กดปุ่ม ยืนยัน เพื่อดำเนินการต่อ",
          onpress: () => _onSubmitConfirm(),
        );
      },
    );
  }
}
