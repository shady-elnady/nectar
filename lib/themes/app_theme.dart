import 'package:flutter/material.dart';
import 'package:nectar_mac/App/Utils/Assets/app_fonts.dart';

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
  // static Color primaryColorDark = const Color(0xff181725);
  static Color primaryColorDark = Colors.black;
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
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: primarySwatch,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    scaffoldBackgroundColor: themeColor,
    hintColor: darkBgColor,
    canvasColor: themeColor,
    indicatorColor: primarySwatch,
    fontFamily: AppFonts.gilroy,
    //AppBar
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
          fontFamily: AppFonts.gilroy,
        ),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
          fontFamily: AppFonts.gilroy,
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
    //
    // Text
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 26,
        fontFamily: AppFonts.gilroy,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.normal,
        color: primaryColorDark,
      ),
      titleMedium: TextStyle(
        fontSize: 22,
        fontFamily: AppFonts.gilroy,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.normal,
        color: primaryColorDark,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontFamily: AppFonts.gilroy,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: primaryColorDark,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontFamily: AppFonts.gilroy,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: primaryColorLight,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.gilroy,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: primaryColorLight,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.gilroy,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: primaryColorLight,
      ),
      // For Button
      labelLarge: TextStyle(
        fontSize: 48,
        fontFamily: AppFonts.gilroy,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: themeColor,
      ),
      labelMedium: TextStyle(
        fontSize: 18,
        fontFamily: AppFonts.gilroy,
        fontStyle: FontStyle.normal,
        color: themeColor,
      ),
      labelSmall: TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.gilroy,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.normal,
        color: primaryColorDark,
      ),
    ),
    //
    iconTheme: const IconThemeData(),
    //
    buttonTheme: const ButtonThemeData(),
    //
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (
                // states.contains(MaterialState.pressed) ||
                //   states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.focused)) {
              return primarySwatch;
            }
            // Use the component's default.
            return primaryColorLight;
          },
        ),
      ),
    ),
    //
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (states) => TextStyle(
            fontSize: 18,
            fontFamily: AppFonts.gilroy,
            fontStyle: FontStyle.normal,
            color: themeColor,
          ),
        ),
      ),
    ),
    //
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return primarySwatch;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return primarySwatch;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return primarySwatch;
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return primarySwatch;
        }
        return null;
      }),
    ),
    //
  );
}


/*
add_shopping_cart_outlined → const IconData
add_shopping_cart — material icon named "add shopping cart" (outlined).


shopping_cart_outlined 


*/