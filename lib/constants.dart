import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// * Main App Colors
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const kSecoundaryColor = Color(0xFF6F35A5);

// Colors Text.
const kTextPrimaryColor = Color(0xFF6F35A5);
const kTextSecondaryColor = Colors.black54;

// * Setup TextTheme of this application
final TextTheme baseFont = GoogleFonts.kanitTextTheme();

// * Set App font family
final fontFamily = GoogleFonts.kanit(fontWeight: FontWeight.w400).fontFamily;

// * AppBar Text Style
final TextStyle appBarStyle = GoogleFonts.kanit(
  fontSize: 18,
  color: kTextPrimaryColor,
);

// * Bottom Bar Text Style
final TextStyle bottomTextStyle = TextStyle(
  color: kPrimaryColor,
  fontSize: 16,
);

// * Content Bullet
final TextStyle contentBulletStyle = GoogleFonts.kanit(
  fontSize: 22,
  color: kTextPrimaryColor,
);

// * Content Sub Bullet
final TextStyle contentSubBulletStyle = GoogleFonts.kanit(
  fontSize: 18,
  color: kTextPrimaryColor,
);

// * Content Sub Bullet
final TextStyle contentTextStyle = GoogleFonts.kanit(
  fontSize: 16,
);

// * Header Text Style
final TextStyle header1Style = GoogleFonts.kanit(
  fontSize: 20,
  color: kTextPrimaryColor,
);

final TextStyle subHeaderStyle = GoogleFonts.kanit(
  fontSize: 16,
  color: Colors.black54,
);

final TextStyle header2Style = GoogleFonts.kanit(
  fontSize: 16,
  color: kTextPrimaryColor,
);

final TextStyle descTextStyle = GoogleFonts.kanit(
  color: kTextSecondaryColor,
);

// * TextButton Style
final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  primary: kPrimaryColor,
  backgroundColor: kPrimaryLightColor,
  side: BorderSide(color: kPrimaryLightColor, width: 1),
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final ButtonStyle outlineMainButtonStyle = OutlinedButton.styleFrom(
  primary: kPrimaryColor,
  backgroundColor: kPrimaryColor,
  side: BorderSide(color: kPrimaryColor, width: 1),
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final ButtonStyle outlineButtonWideStyle = OutlinedButton.styleFrom(
  primary: kPrimaryColor,
  backgroundColor: kPrimaryLightColor,
  side: BorderSide(color: kPrimaryLightColor, width: 1),
  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
