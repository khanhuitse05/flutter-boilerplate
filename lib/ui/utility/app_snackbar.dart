import 'package:flutter/material.dart';

SnackBar mySnackBar(String message) {
  return SnackBar(
    content: Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text(
        message,
        textAlign: TextAlign.center,
      ),
    ),
    duration: const Duration(seconds: 2, microseconds: 0),
  );
}
