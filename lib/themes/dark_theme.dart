import 'package:flutter/material.dart';
import '../App/Utils/Assets/app_fonts.dart';

final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  fontFamily: AppFonts.gilroy,
  // Text Theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
  ),
  //
);
