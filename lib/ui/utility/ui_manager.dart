import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double defaultPadding = 15;

IconData get arrowBack {
  if (Platform.isIOS) {
    return Icons.arrow_back_ios;
  } else {
    return Icons.arrow_back;
  }
}

const ShapeBorder roundedTop = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(15),
  ),
);
