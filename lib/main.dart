import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'models/images_model.dart';
import 'models/bottom_nav_model.dart';
import 'models/user_model.dart';
import 'screens/welcome/welcome_screen.dart';
import 'validation/signup_validation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      print("Error $_error");
    }
    if (!_initialized) {
      print("initialize FlutterFire...");
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupValidation>(create: (_) => SignupValidation()),
        ChangeNotifierProvider<BottomNavModel>(create: (_) => BottomNavModel()),
        ChangeNotifierProvider<UserModel>(create: (_) => UserModel()),
        ChangeNotifierProvider<ImageModel>(create: (_) => ImageModel()),
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
