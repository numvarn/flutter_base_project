import 'package:base_project/constants.dart';
import 'package:base_project/screens/operations/components/body_operations.dart';
import 'package:base_project/screens/operations/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class OperationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * for transparent appbar
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text(
          "หน้าดำเนินการหลัก",
          style: appBarStyle,
        ),
        // * for transparent appbar
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: BodyOperations(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
