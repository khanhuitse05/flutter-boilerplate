import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:ping9/src/core/utility.dart';

class ThemeUtils {
  factory ThemeUtils() => instance;

  ThemeUtils._internal();

  static final ThemeUtils instance = ThemeUtils._internal();

  void changeStatusBarColor(ThemeMode themeMode,
      [final Color color = Colors.transparent]) {
    if (Platform.isAndroid) {
      try {
        if (themeMode == ThemeMode.light) {
        } else {}
      } catch (e) {
        printTrace(e.toString());
      }
    } else if (Platform.isIOS) {
      try {
        FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
        if (useWhiteForeground(color)) {
          if (themeMode == ThemeMode.light) {
            FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
          } else {
            FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
          }
        } else {
          FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
