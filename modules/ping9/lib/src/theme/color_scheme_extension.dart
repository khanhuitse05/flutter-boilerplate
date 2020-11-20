import 'package:flutter/material.dart';

extension AppColorScheme on ColorScheme {
  /// -------------Default-------------

  /// The color displayed most frequently across your app’s screens and components.
  // final Color primary;

  /// A darker version of the primary color.
  // final Color primaryVariant;

  /// An accent color that, when used sparingly, calls attention to parts of your app.
  // final Color secondary;

  /// A darker version of the secondary color.
  // final Color secondaryVariant;

  /// The background color for widgets like [Card].
  // final Color surface;

  /// A color that typically appears behind scrollable content.
  // final Color background;

  /// The color to use for input validation errors, e.g. for [InputDecoration.errorText].
  // final Color error;

  /// A color that's clearly legible when drawn on [primary].
  // final Color onPrimary;

  /// A color that's clearly legible when drawn on [secondary].
  // final Color onSecondary;

  /// A color that's clearly legible when drawn on [surface].
  // final Color onSurface;

  /// A color that's clearly legible when drawn on [background].
  // final Color onBackground;

  /// A color that's clearly legible when drawn on [error].
  // final Color onError;

  /// The overall brightness of this color scheme.
  // final Brightness brightness;

  /// -------------Extension-------------

  Color get destructiveButton {
    return this.brightness == Brightness.dark
        ? const Color(0xFF636478)
        : const Color(0xFF636478);
  }

  Color get inputFill {
    return this.brightness == Brightness.dark
        ? const Color(0xFF1F1E23)
        : const Color(0xFFFEFFFF);
  }

  Color get inputBorder {
    return this.brightness == Brightness.dark
        ? const Color(0xFF646477)
        : const Color(0xFFDDE0ED);
  }
}
