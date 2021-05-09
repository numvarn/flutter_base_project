import 'package:base_project/constants.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onpress;

  const CustomAlertDialog({
    Key key,
    this.title,
    this.subtitle,
    this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "${this.title} !",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text("${this.subtitle}"),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Expanded(
                    child: TextButton(
                      child: Text("ตกลง"),
                      style: outlineButtonStyle,
                      onPressed: this.onpress,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
