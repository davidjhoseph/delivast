import 'package:flutter/material.dart';

const primaryColor = Color(0xffFE8137);
const accentColor = Color(0xffDADE66);

ThemeData themeData(BuildContext context) {
  // final primary = Theme.of(context).primary;
  return ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: primaryColor,
    accentColor: accentColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: primaryColor,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      headline1: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[400],
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      // textTheme: ButtonTextTheme.normal,
    ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: ButtonStyle(
        
    //   )
    // )
  );
}
