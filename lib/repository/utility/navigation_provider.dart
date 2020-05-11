import 'dart:async';

import 'package:my_app/locale/language_selector_page.dart';
import 'package:my_app/view/sample/home_view.dart';
import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int index = 0;
  final StreamController<int> reTap = StreamController<int>.broadcast();

  void switchTo(int value) {
    if (index != value) {
      index = value;
      notifyListeners();
    } else {
      reTap.add(index);
    }
  }
}

enum PageName { home, category, search, notification, account }

List<Widget> homeTap = [
  HomeView(),
  Center(
    child: Text(
      'Index 1: Category',
    ),
  ),
  Center(
    child: Text(
      'Index 2: Search',
    ),
  ),
  Center(
    child: Text(
      'Index 2: Notification',
    ),
  ),
  LanguageSelectorPage(),
];