import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color background = Color(0XFFF4F4F4);

const Color primaryTeal = Color(0xff008080);

const Color lightGrey = Color(0xffbdbdbd);
const Color grey = Color(0xff8e8e8e);
const Color black = Color(0xff000000);
const Color textfieldFill = Color(0xffF6F6F6);
const Color white = Color(0xffFFFFFF);

const Color green = Color(0xff34DB7A);
const Color red = Color(0xffF2513D);
const Color yellow = Color(0xffFFD556);

themeData(context) => ThemeData(
    textTheme: GoogleFonts.openSansTextTheme(
      Theme.of(context).textTheme,
    ),
    primarySwatch: Colors.teal,
    primaryColor: white,
    backgroundColor: white,
    accentColor: primaryTeal);
