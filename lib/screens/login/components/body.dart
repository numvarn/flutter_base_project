import 'package:base_project/class/firebaseAuth.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/models/user_model.dart';
import 'package:base_project/screens/operations/operations_screen.dart';
import 'package:base_project/screens/signup/components/or_divider.dart';
import 'package:base_project/screens/signup/components/social_icon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:base_project/screens/login/components/background.dart';
import 'package:base_project/screens/signup/signup_screen.dart';
import 'package:base_project/components/already_have_an_account_acheck.dart';
import 'package:base_project/components/rounded_input_field.dart';
import 'package:base_project/components/rounded_password_field.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  UserModel userModel;

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  /*
  * Login by Firebase auth using email & password
  */
  void _signInWithEmailAndPassword(email, password) async {
    var authHandler = new Auth();

    authHandler.handleSignInEmail(context, email, password).then((User user) async {
      if (user != null) {
        // * keep state to model
        userModel.setCurrentUserID(user.uid);

        /*
        * If login success
        * get and store user profile to model
        */
        FirebaseFirestore.instance.collection('users').doc(email).get().then((element) {
          userModel.setProfile(element.data());
        });

        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new OperationScreen()),
        );
      } else {
        _btnController.stop();
      }
    });
  }

  /*
  * Login by Firebase auth using Google
  */
  void _googleSignIn(BuildContext context) {
    var authHandler = new Auth();
    authHandler.signInWithGoogle(context).then((User user) {
      if (user != null) {
        /*
        * If Google login success
        * get and store user profile to model
        */
        userModel.setCurrentUserID(user.uid);
        FirebaseFirestore.instance.collection('users').doc(user.email).get().then((element) {
          if (element.data() != null) {
            userModel.setProfile(element.data());
          } else {
            // * if user profile not already create.
            Map<String, dynamic> userData = {
              'email': user.email,
              'fistname': user.displayName,
            };
            print(user);
            userModel.setProfile(userData);
            userModel.setHasProfile(false);
          }
        });

        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new OperationScreen()),
        );
      }
    });
  }

  /*
  * Login by Firebase auth using Facebook
  */
  void _facebookSignIn(BuildContext context) {
    var authHandler = new Auth();
    authHandler.signInWithFacebook(context).then((Map userData) {
      if (userData != null) {
        /*
        * If facebook login success
        * get and store user profile to model
        */
        userModel.setCurrentUserID(userData['id']);
        FirebaseFirestore.instance.collection('users').doc(userData['email']).get().then((element) {
          if (element.data() != null) {
            /*
            * if current user already has profile
            * get profile from firestore and set state to user model
            */
            userData['firstname'] = element.data()['firstname'];
            userData['lastname'] = element.data()['lastname'];
            userData['gender'] = element.data()['gender'];
            userData['phone'] = element.data()['phone'];
            userData['address'] = element.data()['address'];
            userData['dob'] = element.data()['dob'];
          } else {
            // * if user profile not already create.
            userModel.setHasProfile(false);
          }
        });

        // * keep current user profile to state
        userModel.setProfile(userData);

        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new OperationScreen()),
        );
      }
    });
  }

  // * Validate email
  bool _validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(email)) {
      final snackBar = SnackBar(content: Text("Invalid email format"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _btnController.reset();
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    userModel = context.read<UserModel>();
  }

  @override
  Widget build(BuildContext context) {
    String emailField = "";
    String passwordField = "";

    Size size = MediaQuery.of(context).size;

    /*
    * Login button
    */
    final loginButton = RoundedLoadingButton(
      child: Text(
        "เข้าสู่ระบบ",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      controller: _btnController,
      width: MediaQuery.of(context).size.width,
      color: kPrimaryColor,
      onPressed: () {
        if (_validateEmail(emailField) && passwordField.isNotEmpty) {
          _signInWithEmailAndPassword(emailField, passwordField);
        } else {
          print("Invalid data");
          _btnController.stop();
        }
      },
    );

    return Background(
      child: SingleChildScrollView(
        child: Container(
          width: size.width * .8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "เข้าสู่ระบบเพื่อใช้งาน",
                style: appBarStyle,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "อีเมล",
                onChanged: (value) {
                  emailField = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  passwordField = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              loginButton,
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {
                      _facebookSignIn(context);
                    },
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {
                      _googleSignIn(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
