import 'dart:async';

import 'package:chat_app/core/storage_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  int _currentTheme = 0;

  StreamController<ThemeData> _themeController = StreamController<ThemeData>();

  Stream<ThemeData> get theme => _themeController.stream;

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

    _themeController
        .add(_currentTheme == 0 ? primaryTheme() : secondaryTheme());
    await StorageManager.setObject("user_theme", index);
  }

  ThemeData primaryTheme() {
    return ThemeData(
        primarySwatch: Colors.blue,

        /// Support swipe from edge to navigate the previous scene
        /// for both iOS and android
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ));
  }

  // Example Dark mode
  ThemeData secondaryTheme() {
    return ThemeData(
      brightness: Brightness.dark,

      /// The background color for major parts of the app (toolbars, tab bars, etc)
      primaryColor: Colors.purple[200],
      primaryColorBrightness: Brightness.light,
      canvasColor: Colors.white,

      /// Accent color is also known as the secondary color.
      accentColor: Colors.teal[200],
      accentColorBrightness: Brightness.dark,
      backgroundColor: Color(0xff121212),

      /// The background color for a typical material app or a page within the app.
      scaffoldBackgroundColor: Color(0xff121212),
      bottomAppBarColor: Color(0xff1e1e1e),

      /// The color of [Material] when it is used as a [Card].
      cardColor: Colors.white12,
      highlightColor: Colors.teal[200],
      splashColor: Color(0xff121212),
      disabledColor: Colors.white12,
      dialogBackgroundColor: Color(0xff1e1e1e),
      errorColor: Color(0xffcf6679),

      /// App bar theme
      appBarTheme: AppBarTheme(
          textTheme: TextTheme(
              title: TextStyle(color: Colors.white),
              caption: TextStyle(color: Colors.white)),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          )),

      /// Icon theme
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      primaryIconTheme: IconThemeData(
        color: Colors.white,
      ),

      /// Support swipe from edge to navigate the previous scene
      /// for both iOS and android
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
