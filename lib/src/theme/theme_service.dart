import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/core/user_defaults.dart';
import 'package:my_app/src/theme/theme_utility.dart';

const String _referencesThemeKey = "_referencesThemeKey";

class ThemeService extends ChangeNotifier {
  late ThemeMode themeMode;

  ThemeService() {
    final String? theme =
        UserDefaults.instance.getObjectByKey(_referencesThemeKey) as String;
    changeTheme(theme);
  }

  // fix theme
  void changeTheme(String? theme) {
    const _default = ThemeMode.dark;
    if (theme == 'ThemeMode.light') {
      themeMode = ThemeMode.light;
    } else if (theme == 'ThemeMode.system') {
      themeMode = ThemeMode.system;
    } else {
      // default dark theme
      themeMode = _default;
    }
    notifyListeners();
    UserDefaults.instance
        .setObject(_referencesThemeKey, theme ?? _default.toString());
    _fixAppbarWithTheme(themeMode);
  }

  void switchTheme() {
    if (Get.isDarkMode) {
      changeTheme('ThemeMode.light');
    } else {
      changeTheme('ThemeMode.dark');
    }
  }

  void _fixAppbarWithTheme(ThemeMode theme) {
    if (theme == ThemeMode.system) {
      ThemeUtility.changeStatusBarColor(
          Get.isDarkMode ? ThemeMode.dark : ThemeMode.light);
    } else {
      ThemeUtility.changeStatusBarColor(theme);
    }
  }
}
