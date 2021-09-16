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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _darkPrimaryColor,
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
        color: _darkFontColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: _darkSecondaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.pink,
          width: 2.0,
        ),
      ),
    ),
  );
}
