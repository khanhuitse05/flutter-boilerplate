import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData primaryTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  primaryColor: Colors.blue,
  accentColor: Colors.green,
  fontFamily: 'Muli',

  /// App bar theme
  cupertinoOverrideTheme: const CupertinoThemeData(
    brightness: Brightness.light,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    actionsIconTheme: const IconThemeData(
      color: Colors.blue,
    ),
    iconTheme: const IconThemeData(
      color: Colors.blue,
    ),
  ),
  /// button
  buttonTheme: const ButtonThemeData(
    height: 40,
    shape: StadiumBorder(),
    textTheme: ButtonTextTheme.accent,
  ),
  iconTheme: const IconThemeData(color: Colors.blue),

  inputDecorationTheme: InputDecorationTheme(
    filled: false,
    alignLabelWithHint: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  ),

  /// Support swipe from edge to navigate the previous scene
  /// for both iOS and android
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
