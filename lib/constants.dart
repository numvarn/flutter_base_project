import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// * Main App Colors
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const kSecoundaryColor = Color(0xFF6F35A5);

const kTextPrimaryColor = Color(0xFF6F35A5);

// * AppBar Text Style
TextStyle appBarStyle = GoogleFonts.kanit(
  fontSize: 18,
  color: kTextPrimaryColor,
);

// * Setup TextTheme of this application
TextTheme baseFont = GoogleFonts.kanitTextTheme();

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
