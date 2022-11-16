import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        cardTheme: CardTheme(color: creamColor2),
        primaryColor: Colors.deepPurple,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.poppins().fontFamily,
        canvasColor: creamColor,
        cardColor: creamColor2,
        colorScheme: ColorScheme.light(
            secondary: darkBlueishColor, onSecondary: darkBlueishColor),
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          // titleTextStyle: const TextStyle(color: Colors.black),
          backgroundColor: MyThemes.creamColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        textTheme: const TextTheme(headline6: TextStyle(color: Colors.black)),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        cardTheme: CardTheme(color: darkCreamColor2),
        primaryColor: Colors.deepPurple,
        brightness: Brightness.dark,
        canvasColor: darkCreamColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: darkCreamColor2,
        colorScheme: ColorScheme.dark(
            secondary: lightBlueishColor, onSecondary: Colors.white),
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          backgroundColor: MyThemes.darkCreamColor,
          centerTitle: true,
          foregroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(headline6: TextStyle(color: Colors.white)),
      );

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBlueishColor = const Color(0Xff403b58);
  static Color lightBlueishColor = const Color.fromARGB(255, 9, 80, 13);
  static Color creamColor2 = Colors.green.shade100;
  static Color darkCreamColor = const Color.fromARGB(255, 46, 68, 80);
  static Color darkCreamColor2 = const Color.fromARGB(255, 5, 10, 19);
}
