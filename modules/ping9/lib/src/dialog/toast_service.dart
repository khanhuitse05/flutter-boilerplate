import 'package:get/get.dart';

class Toast {
  static void show(String message) {
    Get.rawSnackbar(message: message);
  }

  static void snackbar(String title, String message) {
    return Get.snackbar(title, message);
  }
}
