import 'package:flutter/material.dart';

import 'colors.dart';

class AppStyles {
  static const title = TextStyle(
    fontSize: 16,
    color: AppColors.text,
    fontWeight: FontWeight.w700,
  );
  static const titleLarge = TextStyle(
    fontSize: 18,
    color: AppColors.text,
    fontWeight: FontWeight.w700,
  );
  static const titleSmall = TextStyle(
    fontSize: 14,
    color: AppColors.text,
    fontWeight: FontWeight.w700,
  );

  static const body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.text,
  );

  static const inputStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

// https://api.flutter.dev/flutter/material/TextTheme-class.html
  static TextTheme get textTheme {
    final textTheme = const TextTheme().apply(
      bodyColor: AppColors.text,
      displayColor: AppColors.text,
    );
    return textTheme;
  }
}
