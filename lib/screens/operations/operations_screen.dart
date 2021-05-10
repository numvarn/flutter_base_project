import 'package:base_project/components/drawer_nav.dart';
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
        // * for transparent appbar
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: kPrimaryColor),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_rounded,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.person,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: BodyOperations(),
      drawer: DrawerNavigator(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
