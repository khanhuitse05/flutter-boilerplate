import 'dart:async';
import 'package:get/get_state_manager/get_state_manager.dart';

class TabBarProvider extends GetxController {
  int index = 0;
  final StreamController<int> reTap = StreamController<int>.broadcast();

  void switchTo(int value) {
    if (index != value) {
      index = value;
      update();
    } else {
      reTap.add(index);
    }
  }
}
