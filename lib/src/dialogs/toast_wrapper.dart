import 'package:fluttertoast/fluttertoast.dart';

class XToast {
  static Future<bool?> show(String? message) {
    return Fluttertoast.showToast(msg: message ?? '');
  }
}
