import 'package:chat_app/core/storage_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  int _currentIndex = 0;

  List get _theme => [primaryTheme, secondaryTheme];

  ThemeData get currentTheme => _theme[_currentIndex];

  ThemeManager() {
    loadUserTheme();
  }

  loadUserTheme() async {
    var index = await StorageManager.getObjectByKey("user_theme") ?? 0;
    changeTheme(index);
  }

  switchTheme() {
    changeTheme(_currentIndex == 0 ? 1 : 0);
  }

  changeTheme(int index) async {
    _currentIndex = index;
    notifyListeners();
    StorageManager.setObject("user_theme", index);
  }

  ThemeData get primaryTheme {
    var title = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        letterSpacing: 0.15);

    return ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,

        buttonColor: Colors.blue,
        /// App bar theme
        appBarTheme: AppBarTheme(
//        color: Colors.white,
          textTheme: TextTheme(
            title: title,
            caption: TextStyle(color: Colors.white),
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),

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
  ThemeData get secondaryTheme {
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
