import 'package:base_project/constants.dart';
import 'package:flutter/material.dart';

import 'components/body_detail_edit.dart';

class DetailEditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text(
          "แก้ไขรายละเอียด",
          style: appBarStyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: kPrimaryColor),
      ),
      body: BodyDetailEdit(),
    );
  }
}
