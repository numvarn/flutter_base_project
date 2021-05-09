import 'package:base_project/components/rounded_input_field.dart';
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
  static TextEditingController addressController = new TextEditingController();
  static TextEditingController mobileController = new TextEditingController();

  // * mark text form field
  var maskPhoneFormatter = new MaskTextInputFormatter(mask: '###-###-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    // * Sign-up validation services
    final validationService = Provider.of<SignupValidation>(context);

    return Container(
      child: Form(
        child: Column(
          children: [
            RoundedInputField(
              hintText: "เบอร์โทรติดต่อ",
              errorText: validationService.phone.error,
              icon: Icons.phone_outlined,
              controller: mobileController,
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
          ],
        ),
      ),
    );
  }
}
