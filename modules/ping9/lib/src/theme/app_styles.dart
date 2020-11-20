import 'dart:math';

import 'package:flutter/material.dart';


double hPadding = 16;
double hMargin = 16;

class AppStyles {
  static const List<BoxShadow> boxShadow = <BoxShadow>[
    BoxShadow(
      color: Color(0xFFC4C4C4),
      offset: Offset(1, 4),
      blurRadius: 5,
    ),
  ];

  static void initStyleByScreen(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    hPadding = min(32, width / 13);
    hPadding = min(24, width / 15);
  }

  static TextStyle title =
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
}

extension TextStyleExtension on TextStyle {
  TextStyle mergeColor(Color color) {
    return this.merge(TextStyle(color: color));
  }
}
