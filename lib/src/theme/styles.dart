import 'package:flutter/material.dart';

import 'colors.dart';

class XStyles {
  static const title = TextStyle(
    fontSize: 16,
    color: XColors.text,
    fontWeight: FontWeight.w700,
  );

  static const body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: XColors.text,
  );

  static const inputStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

// https://api.flutter.dev/flutter/material/TextTheme-class.html
  static TextTheme get textTheme {
    final textTheme = const TextTheme().apply(
      bodyColor: XColors.text,
      displayColor: XColors.text,
    );
    return textTheme;
  }
}
