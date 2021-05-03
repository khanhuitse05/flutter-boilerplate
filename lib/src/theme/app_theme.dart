import "package:flutter/material.dart";
import 'package:my_app/src/theme/app_colors.dart';

import 'color_scheme_extension.dart';

export 'app_colors.dart';
export 'app_styles.dart';
export 'color_scheme_extension.dart';

/// default dark mode
class AppTheme {
  // share style
  static const String? fontFamily = null;

  static InputBorder _getInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
      borderRadius: BorderRadius.circular(5),
    );
  }

  /// override style: default dark mode

  static ThemeData dark() {
    const ColorScheme colorScheme = ColorScheme.dark();
    final theme = ThemeData(
      fontFamily: fontFamily,

      /// Colors
      primarySwatch: AppColors.primarySwatch,
      accentColor: AppColors.accentColor,
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.dark,

      /// colorScheme
      colorScheme: colorScheme,

      /// Text theme
      textTheme: const TextTheme(),

      /// Appbar
      appBarTheme: const AppBarTheme(elevation: 0),

      /// Input field
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: Colors.white54),
        // fontStyle: FontStyle.italic
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: colorScheme.inputFill,
        enabledBorder: _getInputBorder(colorScheme.inputBorder),
        focusedBorder: _getInputBorder(Colors.white),
        disabledBorder: _getInputBorder(Colors.grey),
        errorBorder: _getInputBorder(Colors.red),
        focusedErrorBorder: _getInputBorder(Colors.red),
        focusColor: Colors.blue,
      ),

      /// Button
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF30A559),
        height: 50,
      ),
    );
    return theme;
  }

  static ThemeData light() {
    const colorScheme = ColorScheme.light();
    final theme = ThemeData(
      fontFamily: fontFamily,

      /// Colors
      primarySwatch: AppColors.primarySwatch,
      accentColor: AppColors.accentColor,
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,

      /// colorScheme
      colorScheme: colorScheme,

      /// Text theme
      textTheme: const TextTheme(
        button: TextStyle(fontSize: 16),
      ),

      /// Appbar
      appBarTheme: const AppBarTheme(elevation: 0),

      /// Input field
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: Color(0xFFADB1B7)),
        // fontStyle: FontStyle.italic
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: colorScheme.inputFill,
        enabledBorder: _getInputBorder(colorScheme.inputBorder),
        focusedBorder: _getInputBorder(Colors.white),
        disabledBorder: _getInputBorder(Colors.grey),
        errorBorder: _getInputBorder(Colors.red),
        focusedErrorBorder: _getInputBorder(Colors.red),
        focusColor: Colors.blue,
      ),

      /// Button
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF30A559),
        height: 50,
      ),
    );
    return theme;
  }
}
