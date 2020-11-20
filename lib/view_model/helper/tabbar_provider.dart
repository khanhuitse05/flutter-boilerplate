import 'dart:async';
import 'package:flutter/material.dart';

class TabBarProvider extends ChangeNotifier {
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
