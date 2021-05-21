import 'package:base_project/models/bottom_nav_model.dart';
import 'package:base_project/models/photos_model.dart';
import 'package:base_project/validation/signup_validation.dart';
import 'package:flutter/material.dart';
import 'package:base_project/screens/welcome/welcome_screen.dart';
import 'package:base_project/constants.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupValidation>(create: (_) => SignupValidation()),
        ChangeNotifierProvider<BottomNavModel>(create: (_) => BottomNavModel()),
        ChangeNotifierProvider<PhotosModel>(create: (_) => PhotosModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Base Project',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: kPrimaryColor,
          textTheme: baseFont,
          fontFamily: fontFamily,
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
