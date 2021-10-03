import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/src/theme/styles.dart';

import 'colors.dart';

class XTheme {
  static const String? fontFamily = null;
  static const barOverLayStyle = SystemUiOverlayStyle.light;

  static ThemeData light() => ThemeData(
        fontFamily: fontFamily,

        /// Colors
        primarySwatch: XColors.primaryColors,
        primaryColor: XColors.primary,
        brightness: Brightness.light,
        textTheme: XStyles.textTheme,

        /// ColorScheme
        colorScheme: ColorScheme.light(
          primary: XColors.primary,
        ),

        // Appbar
        appBarTheme: AppBarTheme(
          // default system appbar icon is white
          systemOverlayStyle: barOverLayStyle,
          backgroundColor: XColors.primary,
        ),

        /// input
        inputDecorationTheme: InputDecorationTheme(),

        /// Button
        buttonTheme: ButtonThemeData(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(),
        ),
        iconTheme: IconThemeData(),
      );

  static ThemeData dark() => ThemeData.dark();
}
