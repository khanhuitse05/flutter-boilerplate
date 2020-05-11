import 'dart:io';

import 'package:flutter/material.dart';

const double defaultPadding = 16;

IconData get iconBack {
  if (Platform.isIOS) {
    return Icons.arrow_back_ios;
  } else {
    return Icons.arrow_back;
  }
}

// ignore: avoid_classes_with_only_static_members
class AppStyles {

  static const List<BoxShadow> boxShadow = <BoxShadow>[
    BoxShadow(
      color: Color(0xFFC4C4C4),
      offset: Offset(1, 4),
      blurRadius: 5,
    ),
  ];
}
