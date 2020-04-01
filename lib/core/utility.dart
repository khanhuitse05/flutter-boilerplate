import 'package:intl/intl.dart';

class Utility {

  static bool isNullOrEmpty(dynamic object) {
    if (object == null) {
      return true;
    }
    if (object is String) {
      return object.trim().isEmpty;
    }
    if (object is Iterable) {
      return object.isEmpty;
    }
    if (object is Map) {
      return object.isEmpty;
    }
    return false;
  }


  static String formatPrice(dynamic number) {
    final oCcy = new NumberFormat("#,###", "en_US");
    if (number is String) {
      if (number.toString().isNotEmpty) {
        int value = int.parse(number);

        return oCcy.format(value);
      } else {
        return '';
      }
    } else {
      return oCcy.format(number);
    }
  }
}
