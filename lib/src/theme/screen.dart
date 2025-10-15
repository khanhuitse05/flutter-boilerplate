import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Screens utils with multiple properties access.
class AppScreens {
  const AppScreens._();

  /// Get [MediaQueryData]
  static late MediaQueryData mediaQuery;

  /// The number of device pixels for each logical pixel.
  static double get scale => mediaQuery.devicePixelRatio;

  /// The horizontal extent of this size.
  static double get width => mediaQuery.size.width;

  /// The horizontal pixels of this size.
  static int get widthPixels => (width * scale).toInt();

  /// The vertical extent of this size.
  static double get height => mediaQuery.size.height;

  /// The vertical pixels of this size.
  static int get heightPixels => (height * scale).toInt();

  /// Top offset, usually is the notch size.
  static double get topSafeHeight => mediaQuery.padding.top;

  /// Bottom offset, usually is the action bar/navigation bar size.
  static double get bottomSafeHeight => mediaQuery.padding.bottom;

  /// Height exclude top and bottom safe height.
  static double get safeHeight => height - topSafeHeight - bottomSafeHeight;

  /// Method to update status bar's style.
  static void updateStatusBarStyle(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}
