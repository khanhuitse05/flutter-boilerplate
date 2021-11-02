import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _keys {
  static const String theme = 'app-theme';
}

class UserPrefs {
  factory UserPrefs() => instance;
  UserPrefs._internal();

  static final UserPrefs instance = UserPrefs._internal();
  late SharedPreferences _prefs;
  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // theme
  ThemeMode getTheme() {
    final value = _prefs.getString(_keys.theme);
    return ThemeMode.values.firstWhere(
      (e) => e.toString().toLowerCase() == '$value'.toLowerCase(),
      orElse: () => ThemeMode.system,
    );
  }

  void setTheme(ThemeMode value) {
    _prefs.setString(_keys.theme, value.toString().toLowerCase());
  }
}
