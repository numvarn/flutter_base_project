import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/rounded_input_field.dart';
import '/components/rounded_password_field.dart';
import '/constants.dart';
import '/validation/signup_validation.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({Key key}) : super(key: key);

  @override
  AccountFormState createState() => AccountFormState();
}

class AccountFormState extends State<AccountForm> {
  static TextEditingController controllerEmail = TextEditingController();
  static TextEditingController controllerPassword = TextEditingController();
  static TextEditingController controllerPasswordComfirm = TextEditingController();
  SignupValidation validationService;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // * Sign-up validation services
    validationService = Provider.of<SignupValidation>(context);

    return Container(
      width: size.width * .8,
      child: Form(
        child: Column(
          children: [
            RoundedInputField(
              hintText: "อีเมล",
              errorText: validationService.email.error,
              icon: Icons.email_outlined,
              controller: controllerEmail,
              onChanged: (value) {
                validationService.validateEmail(value);
              },
            ),
            RoundedPasswordField(
              hintText: "รหัสผ่าน (8 ตัวอักษรขึ้นไป)",
              icons: Icons.vpn_key_outlined,
              controller: controllerPassword,
              errorText: validationService.password.error,
              onChanged: (value) {
                validationService.validatePasswordStructure(value);
              },
            ),
            RoundedPasswordField(
              hintText: "ยืนยันรหัสผ่าน",
              controller: controllerPasswordComfirm,
              errorText: validationService.passwordConfirm.error,
              icons: Icons.vpn_key_rounded,
              onChanged: (passwordConfirm) {
                validationService.validateConfirmPassword(validationService.password.value, passwordConfirm);
              },
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  validateAccountForm();
                },
                child: Text("ต่อไป"),
                style: outlineCurveStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  // * validate form data
  void validateAccountForm() {
    if (validationService.accountIsValid()) {
      validationService.setIndex(1);
    }
  }
}
