import 'package:base_project/screens/Login/login_screen.dart';
import 'package:base_project/screens/signup/components/background.dart';
import 'package:base_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompletedSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // * for transparent appbar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),
        // * for transparent appbar
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Background(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ลงทะเบียนสมบูรณ์"),
              SizedBox(
                height: 50,
              ),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.25,
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                style: outlineButtonStyle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text("เข้าใช้งานระบบ"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
