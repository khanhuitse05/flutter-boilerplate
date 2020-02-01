import 'dart:async';

import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int index = 0;

  var reTap = StreamController<int>.broadcast();

  switchTo(int value) {
    if (index != value) {
      this.index = value;
      notifyListeners();
    } else {
      reTap.add(index);
    }
  }
}

enum PageName { home, category, search, notification, account }

List<Widget> homeTap = [
  Text(
    'Index 0: Home',
  ),
  Text(
    'Index 1: Category',
  ),
  Text(
    'Index 2: Search',
  ),
  Text(
    'Index 2: Notification',
  ),
  Text(
    'Index 2: Account',
  ),
];