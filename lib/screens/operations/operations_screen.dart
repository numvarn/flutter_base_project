import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/components/drawer_nav.dart';
import '/constants.dart';
import '/screens/operations/components/body_operations.dart';
import '/screens/operations/components/bottom_nav_bar.dart';
import '/screens/search/search_screen.dart';

class OperationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
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
