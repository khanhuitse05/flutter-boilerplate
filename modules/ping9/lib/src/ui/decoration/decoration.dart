import 'package:flutter/material.dart';

class MyDecoration extends BoxDecoration {
  MyDecoration.shadow({double radius, Color color})
      : super(
          borderRadius: BorderRadius.circular(radius),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withAlpha(50),
              offset: const Offset(1, 4),
              blurRadius: 5,
            ),
          ],
        );
}
