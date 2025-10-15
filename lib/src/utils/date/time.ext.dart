import 'package:flutter/material.dart';

extension TimeExt on TimeOfDay {
  String get getString =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}
