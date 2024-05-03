import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleConstant{
  static TextStyle oswaldBold = GoogleFonts.oswald(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle latoBold = GoogleFonts.lato(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle latoReg = GoogleFonts.lato(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
}