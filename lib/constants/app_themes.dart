import 'package:flutter/material.dart';

class AppThemes {
  static const Color _darkPrimaryColor = Colors.pink;
  static const Color _darkSecondaryColor = Color(0XFF9DDFD3);
  static const Color _darkPrimaryVariantColor = Color(0xFF263238);
  static const Color _darkSnackBarBackgroundErrorColor = Colors.red;
  static const Color _darkFontColor = Colors.white;
  static const Color _errorColor = Colors.red;
  static const Color _darkIconColor = Colors.yellow;
  static const Color _darkAppBarColor = Colors.green;

  static final ThemeData darkTheme = ThemeData(
    // fontFamily: AppFontFamily.productSans,
    scaffoldBackgroundColor: _darkPrimaryVariantColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _darkPrimaryColor,
      splashColor: Colors.white.withOpacity(0.25),
    ),
    colorScheme: const ColorScheme.light(
      primary: _darkPrimaryColor,
      primaryVariant: _darkPrimaryVariantColor,
      secondary: _darkSecondaryColor,
      // onPrimary: _darkOnPrimaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: _darkSnackBarBackgroundErrorColor),
    iconTheme: const IconThemeData(
      color: _darkIconColor,
    ),
    popupMenuTheme: const PopupMenuThemeData(color: _darkAppBarColor),
    // textTheme: _darkTextTheme, // Font change here !!

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: _darkFontColor,
        backgroundColor: _darkPrimaryColor,
        onSurface: _errorColor,
      ),
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      fillColor: _darkPrimaryColor,
      labelStyle: const TextStyle(
          fontWeight: FontWeight.w300, color: Colors.white70, fontSize: 16),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(color: _darkPrimaryColor),
      ),
      suffixStyle: const TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          color: _darkPrimaryColor,
          width: 2.0,
        ),
      ),
    ),

    canvasColor: _darkPrimaryVariantColor,
  );
}
