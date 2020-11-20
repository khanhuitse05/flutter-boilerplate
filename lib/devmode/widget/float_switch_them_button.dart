import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping9/ping9.dart';

class FloatSwitchThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: const Key("FloatSwitchThemeButton"),
      onPressed: Get.find<ThemeService>().switchTheme,
      child: const Icon(Icons.amp_stories_outlined),
    );
  }
}
