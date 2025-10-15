import 'package:flutter/material.dart';

class ButtonSize {
  final double minWidth;
  final double iconSize;
  final double height;
  final TextStyle style;
  final double padding;

  ButtonSize({
    required this.minWidth,
    required this.iconSize,
    required this.height,
    required this.style,
    required this.padding,
  });

  factory ButtonSize.small() {
    return ButtonSize(
      height: 32,
      minWidth: 60,
      iconSize: 16,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      padding: 12,
    );
  }
  factory ButtonSize.medium() {
    return ButtonSize(
      height: 40,
      minWidth: 80,
      iconSize: 20,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      padding: 16,
    );
  }
  factory ButtonSize.large() {
    return ButtonSize(
      height: 48,
      minWidth: 100,
      iconSize: 24,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      padding: 16,
    );
  }
}
