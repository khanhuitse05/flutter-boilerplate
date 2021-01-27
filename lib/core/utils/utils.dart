import 'package:intl/intl.dart';

class Utility {
  static String formatPrice(Object number) {
    final oCcy = NumberFormat("#,###", "en_US");
    if (number is String) {
      if (number.toString().isNotEmpty) {
        final int value = int.parse(number);

        return oCcy.format(value);
      } else {
        return '';
      }
    } else {
      return oCcy.format(number);
    }
  }
}
