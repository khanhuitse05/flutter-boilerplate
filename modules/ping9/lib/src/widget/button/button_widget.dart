import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping9/src/theme/app_theme.dart';

class ButtonPrimary extends RaisedButton {
  ButtonPrimary({
    Key key,
    VoidCallback onPressed,
    String title,
    Color color,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: Text(
            title,
            key: ValueKey('text_ButtonWidget$title'),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          color: color,
        );
}

class ButtonDestructive extends RaisedButton {
  ButtonDestructive({
    Key key,
    VoidCallback onPressed,
    String title,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: Text(
            title,
            key: ValueKey('text_ButtonWidget$title'),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          color: Get.theme.colorScheme.destructiveButton,
        );
}
