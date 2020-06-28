import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/view/sample/home_view.dart';
import 'package:flutter/material.dart';



final ChangeNotifierProvider<NavigationProvider> navProvider =
ChangeNotifierProvider((_) {
  return NavigationProvider();
});

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

enum PageName { home, category, search }

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
];