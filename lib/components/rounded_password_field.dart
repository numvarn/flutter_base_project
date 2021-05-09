import 'package:flutter/material.dart';
import 'package:base_project/components/text_field_container.dart';
import 'package:base_project/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final String errorText;
  final IconData icons;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String Function(String) validator;

  const RoundedPasswordField({
    Key key,
    this.hintText = "รหัสผ่าน",
    this.errorText,
    this.icons = Icons.lock,
    this.controller,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isObscureText = true;

  // On change obscureText.
  _onChangeObscureText() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: isObscureText,
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.errorText,
          icon: Icon(
            widget.icons,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: () => _onChangeObscureText(),
            icon: isObscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
