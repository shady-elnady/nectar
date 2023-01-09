import 'package:flutter/material.dart';
import 'package:nectar_mac/themes/app_fonts.dart';

class AppTheme {
  //App name
  static String appName = "Nectar";
  // Global Colors
  static Color googleColor = const Color(0xff5383EC);
  static Color faceBookColor = const Color(0xff4A66AC);
  // Light Theme Colors
  static Color primarySwatch = const Color(0xff53B175);
  static Color themeColor = const Color(0xffFFFFFF);
  static Color darkBgColor = const Color(0xffF2F3F2);
  static Color primaryColorDark = const Color(0xff030303);
  static Color primaryColorLight = const Color(0xff7C7C7C);
  // Dark Theme Colors
  // old
  static Color lightPrimary = const Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = const Color(0xff5563ff);
  static Color darkAccent = const Color(0xff5563ff);
  static Color lightBG = const Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color? ratingBG = Colors.yellow[600];

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primarySwatch,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    scaffoldBackgroundColor: themeColor,
    canvasColor: themeColor,
    indicatorColor: primarySwatch,
    fontFamily: AppFonts.gilroy,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ).titleLarge,
    ),
    // TextField
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
      ),
      fillColor: darkBgColor,
      filled: true,
      prefixIconColor: primaryColorDark,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
    //
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 2,
      selectedIconTheme: IconThemeData(
        color: primarySwatch,
        size: 20,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        color: primaryColorDark,
        fontWeight: FontWeight.normal,
      ),
      unselectedIconTheme: IconThemeData(
        color: primaryColorDark,
        size: 20,
      ),
      unselectedItemColor: primaryColorDark,
      selectedItemColor: primarySwatch,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        color: primarySwatch,
        fontWeight: FontWeight.normal,
      ),
    ),
  );

  // static ThemeData darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   canvasColor: darkBG,
  //   primaryColor: darkPrimary,
  //   scaffoldBackgroundColor: darkBG,
  //   indicatorColor: darkAccent,
  //   appBarTheme: AppBarTheme(
  //     toolbarTextStyle: TextTheme(
  //       titleSmall: TextStyle(
  //         color: lightBG,
  //         fontSize: 18.0,
  //         fontWeight: FontWeight.w800,
  //       ),
  //     ).bodyMedium,
  //     titleTextStyle: TextTheme(
  //       titleSmall: TextStyle(
  //         color: lightBG,
  //         fontSize: 18.0,
  //         fontWeight: FontWeight.w800,
  //       ),
  //     ).titleLarge,
  //   ),
  //   colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkAccent),
  // );
}
