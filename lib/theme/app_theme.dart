import 'dart:async';

import 'package:chat_app/core/storage_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {

  List<ThemeData> get _appThemes => [
        primaryTheme(),
        secondaryTheme(),
      ];

  int _currentTheme = 0;

  StreamController<ThemeData> _themeController = StreamController<ThemeData>();

  Stream<ThemeData> get theme => _themeController.stream;
  StreamController<int> themeIndex = StreamController<int>();

  ThemeManager() {
    loadUserTheme();
  }

  loadUserTheme() async {
    var index = await StorageManager.getObjectByKey("user_theme") ?? 0;
    changeTheme(index);
  }

  switchTheme() {
    changeTheme(_currentTheme == 0 ? 1 : 0);
  }

  changeTheme(int index) async {
    _currentTheme = index;

    var userTheme = _appThemes[_currentTheme];
    _themeController.add(userTheme);
    themeIndex.add(_currentTheme);
    await StorageManager.setObject("user_theme", index);
  }


  ThemeData primaryTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }

  ThemeData secondaryTheme() {
    return ThemeData(
      primarySwatch: Colors.red,
    );
  }
}
