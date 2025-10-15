import 'package:flutter/material.dart';
import 'package:myapp/src/theme/styles.dart';

import 'colors.dart';

class AppTheme {
  static const String? fontFamily = null;

  static ThemeData light() => ThemeData(
        fontFamily: fontFamily,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,

        /// dialog
        dialogTheme: DialogThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        /// Colors
        primaryColor: AppColors.primary,
        brightness: Brightness.light,

        /// Text
        textTheme: AppStyles.textTheme,

        /// ColorScheme
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
        ),

        // Appbar
        appBarTheme: const AppBarTheme(
          // default system appbar icon is white
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),

        /// input
        inputDecorationTheme: const InputDecorationTheme(),

        /// Button
        buttonTheme: const ButtonThemeData(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromHeight(50),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            fixedSize: const Size.fromHeight(50),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(),
        ),
        iconTheme: const IconThemeData(),
      );

  // do not support dark theme yet
  static ThemeData dark() => light();
}
