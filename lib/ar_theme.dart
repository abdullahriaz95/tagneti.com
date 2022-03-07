import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Cubic textFirstEntryCurve = Curves.easeInOutBack;
  static Duration textFirstEntryAnimationDuration = Duration(milliseconds: 500);
  static Duration textFirstEntryDuration = Duration(milliseconds: 50);
  static Duration lineShowDelay = Duration(milliseconds: 1000);
  static Color highlightedTextColor = Color(0xFFCCD6F6);
  static Color normalTextColor = Color(0xFF8892B0);
  static Color selectedListColor = Color(0xFF112240);

  static ThemeData arTheme(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFF0A192F),
      accentColor: Color(0xFF64FFD9),
      //iconTheme: IconThemeData(color: Colors.white, size: 20.0),//filters
      //buttonColor: Colors.red,

      buttonTheme: ButtonThemeData(
        shape: StadiumBorder(),
        height: 40,
        minWidth: double.infinity,
        buttonColor: Colors.white,
        textTheme: ButtonTextTheme
            .primary, //todo-theme: not working! while using accent is working!

        //colorScheme: ColorScheme.light()
      ),

      textTheme: GoogleFonts.montserratTextTheme(textTheme).copyWith(
        headline1: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: highlightedTextColor,
                fontSize: 70,
                fontWeight: FontWeight.w700)),
        headline2: GoogleFonts.montserrat(
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        headline3: GoogleFonts.montserrat(
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        headline6: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18)),
        subtitle2: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.lightBlue[800],
        ),
        bodyText2: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: normalTextColor,
            fontSize: 13,
          ),
        ),
        bodyText1: GoogleFonts.montserrat(
            textStyle: TextStyle(
          color: normalTextColor,
          fontSize: 16,
        )),
        button: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
