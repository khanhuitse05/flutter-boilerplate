
import 'dart:io';

import 'package:flutter/material.dart';

IconData get iconBack {
  if (Platform.isIOS) {
    return Icons.arrow_back_ios;
  } else {
    return Icons.arrow_back;
  }
}

Widget hSpace(double height) => SizedBox(height: height);
const Widget hSpaceTiny = SizedBox(width: 5.0);
const Widget hSpaceSmall = SizedBox(width: 10.0);
const Widget hSpaceMedium = SizedBox(width: 25.0);


Widget vSpace(double height) => SizedBox(height: height);
const Widget vSpaceTiny = SizedBox(height: 5.0);
const Widget vSpaceSmall = SizedBox(height: 10.0);
const Widget vSpaceMedium = SizedBox(height: 25.0);
const Widget vSpaceLarge = SizedBox(height: 50.0);
const Widget vSpaceMassive = SizedBox(height: 120.0);