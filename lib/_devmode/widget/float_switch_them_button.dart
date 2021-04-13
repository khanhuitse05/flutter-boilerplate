import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/theme/theme_service.dart';

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
