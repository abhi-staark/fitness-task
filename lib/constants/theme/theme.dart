import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeClass {
  static Color lightPrimaryColor = HexColor('#DF0054');
  Color darkPrimaryColor = Colors.white;
  //HexColor('#480032');
  static Color secondaryColor = HexColor('#FF8B6A');
  Color accentColor = HexColor('#FFD2BB');

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
        primary: lightPrimaryColor,
        secondary: secondaryColor),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white, // Set the background color to white
    ),
   
  );

}

ThemeClass _themeClass = ThemeClass();
