import 'package:flutter/material.dart';

class AppDecorations {
  static final shadow = [
    BoxShadow(
      offset: const Offset(2, 2),
      blurRadius: 2,
      color: Colors.black.withValues(alpha: 0.1),
    ),
  ];

  static const InputDecoration inputNoneBorder = InputDecoration(
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
  );
}
