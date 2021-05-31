import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '/constants.dart';
import '/screens/Login/login_screen.dart';
import '/screens/signup/components/background.dart';
import '/validation/signup_validation.dart';

class CompletedSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var validationService = Provider.of<SignupValidation>(context);

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
              Text(
                "ลงทะเบียนสมบูรณ์",
                style: appBarStyle,
              ),
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
                  // set carousel index to 0
                  validationService.setIndex(0);
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
