import 'package:flutter/material.dart';
import 'package:base_project/components/text_field_container.dart';
import 'package:base_project/constants.dart';
import 'package:flutter/services.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final String errorText;
  final IconData icon;
  final int minLines;
  final int maxLines;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String Function(String) validator;
  final Function() onTab;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.errorText,
    this.minLines = 1,
    this.maxLines = 1,
    this.keyboardType,
    this.inputFormatters,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
    this.validator,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        cursorColor: kPrimaryColor,
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        onTap: onTab,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          errorText: errorText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
