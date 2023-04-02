import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamcolor,
      buttonTheme: ButtonThemeData(
        buttonColor: darkBluishcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black), toolbarTextStyle: Theme.of(context).textTheme.bodyMedium, titleTextStyle: Theme.of(context).textTheme.titleLarge), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: darkBluishcolor));

  static ThemeData DarkTheme(BuildContext context) => ThemeData(
      // brightness: Brightness.dark,
      brightness: Brightness.light,
      // colorScheme: ColorScheme.light(),
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: blue,
      buttonTheme: ButtonThemeData(
      buttonColor: lightBluishColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white), toolbarTextStyle: Theme.of(context).textTheme.bodyMedium, titleTextStyle: Theme.of(context).textTheme.titleLarge), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white));

  //Colors
  static Color creamcolor = const Color(0xFFFFF3E0);
  static Color blue = Vx.gray900;
  static Color darkBluishcolor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.blue500;
}
