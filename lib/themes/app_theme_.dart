import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

final ThemeData appThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primarySwatch,
  fontFamily: AppFonts.gilroy,
  canvasColor: AppColors.themeColor,
  dialogBackgroundColor: AppColors.bgDarkColor,
  scaffoldBackgroundColor: AppColors.themeColor,
  badgeTheme: const BadgeThemeData(),
  buttonBarTheme: const ButtonBarThemeData(),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        AppColors.primarySwatch,
      ),
      iconColor: MaterialStateProperty.all(
        AppColors.themeColor,
      ),
      foregroundColor: MaterialStateProperty.all(
        AppColors.themeColor,
      ),
    ),
  ),

  /// Text Theme
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.w600,
      color: AppColors.themeColor,
      fontFamily: AppFonts.gilroy,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.primarySwatch,
      fontFamily: AppFonts.gilroy,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.themeColor,
      fontFamily: AppFonts.gilroy,
      fontStyle: FontStyle.normal,
    ),
    //
    displayLarge: TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.w700,
      color: AppColors.titleColor,
      fontFamily: AppFonts.gilroy,
      fontStyle: FontStyle.normal,
    ),
    displayMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.subTitleColor,
      fontFamily: AppFonts.gilroy,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: TextStyle(
      fontFamily: AppFonts.gilroy,
      color: AppColors.subTitleColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    // Title Large
    titleLarge: TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.w600,
      color: AppColors.subTitleColor,
      fontFamily: AppFonts.gilroy,
    ),
    // Title Medium
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.subTitleColor,
      fontFamily: AppFonts.gilroy,
    ),
    // Title Small
    titleSmall: TextStyle(
      fontSize: 14.0,
      color: AppColors.titleColor,
      fontFamily: AppFonts.gilroy,
      letterSpacing: 2,
    ),
    //

    labelLarge: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.w600,
      color: AppColors.themeColor,
      fontFamily: AppFonts.gilroy,
      fontStyle: FontStyle.normal,
    ),
  ),

  ///
  inputDecorationTheme: const InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.inputBorderColor,
      ),
    ),
    labelStyle: TextStyle(
      color: AppColors.subTitleColor,
      fontFamily: AppFonts.gilroy,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
      color: AppColors.titleColor,
      fontFamily: AppFonts.gilroy,
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    ),
  ),
  //
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        AppColors.themeColor,
      ),
      iconColor: MaterialStateProperty.all(
        AppColors.primarySwatch,
      ),
      foregroundColor: MaterialStateProperty.all(
        AppColors.primarySwatch,
      ),
      side: MaterialStateProperty.all(
        const BorderSide(
          width: 1,
          color: AppColors.primarySwatch,
        ),
      ),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    buttonColor: AppColors.primarySwatch,
  ),
  dropdownMenuTheme: const DropdownMenuThemeData(
    textStyle: TextStyle(
      color: AppColors.textDarkColor,
      backgroundColor: AppColors.themeColor,
      fontSize: 18,
      fontFamily: AppFonts.gilroy,
      fontWeight: FontWeight.w500,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.inputBorderColor,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.inputBorderColor,
        ),
      ),
      labelStyle: TextStyle(
        color: AppColors.subTitleColor,
        fontFamily: AppFonts.gilroy,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        fontStyle: FontStyle.normal,
      ),
      hintStyle: TextStyle(
        color: AppColors.hintColor,
        fontFamily: AppFonts.gilroy,
        fontSize: 18,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: AppColors.titleColor,
    ),
    titleTextStyle: TextStyle(
      fontFamily: AppFonts.gilroy,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: AppColors.titleColor,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primarySwatch,
    foregroundColor: AppColors.themeColor,
    iconSize: 45,
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(),
  iconTheme: const IconThemeData(
    color: AppColors.themeColor,
    size: 24,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 2,
    selectedIconTheme: IconThemeData(
      color: AppColors.primarySwatch,
      size: 20,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12,
      color: AppColors.textDarkColor,
      fontWeight: FontWeight.normal,
    ),
    unselectedIconTheme: IconThemeData(
      color: AppColors.textDarkColor,
      size: 20,
    ),
    unselectedItemColor: AppColors.textDarkColor,
    selectedItemColor: AppColors.primarySwatch,
    selectedLabelStyle: TextStyle(
      fontSize: 12,
      color: AppColors.primarySwatch,
      fontWeight: FontWeight.normal,
    ),
  ),

  // iconTheme: IconThemeData(color: Colors.yellow[700], size: 28),
  // primaryIconTheme: IconThemeData(color: Colors.yellow[700], size: 24),
);
