import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping9/src/core/user_defaults.dart';
import 'package:ping9/src/theme/theme_utility.dart';

const String _referencesThemeKey = "_referencesThemeKey";

class ThemeService extends ChangeNotifier {
  ThemeMode themeMode;

  ThemeService() {
    final String theme =
        UserDefaults.instance.getObjectByKey(_referencesThemeKey);
    changeTheme(theme);
  }

  // fix theme
  void changeTheme(String theme) {
    if (theme == 'ThemeMode.light') {
      themeMode = ThemeMode.light;
    } else if (theme == 'ThemeMode.system') {
      themeMode = ThemeMode.system;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
    UserDefaults.instance.setObject(_referencesThemeKey, theme);
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
