
import 'dart:io';

import 'package:flutter/material.dart';

IconData get iconBack {
  if (Platform.isIOS) {
    return Icons.arrow_back_ios;
  } else {
    return Icons.arrow_back;
  }
}