import 'package:intl/intl.dart';

class DateUtility {
  /// flutter test test/utils/date_utility_test.dart
  static String formatTimeWithNow(DateTime? date) {
    if (date == null) {
      return "";
    }
    final DateTime now = DateTime.now();
    if (date.day == now.day &&
        date.month == now.month &&
        date.year == now.year) {
      return 'Today ${defaultTimeFormat.format(date)}';
    }
    if (date.compareTo(now) > 0) {
      final days = date.difference(now);
      if (days.inDays > 5) {
        return defaultFullDateFormat.format(date);
      } else {
        final int inDays = (date.hour > now.hour ||
                (date.hour == now.hour && date.minute >= now.minute))
            ? days.inDays
            : (days.inDays + 1);
        if (inDays > 1) {
          return '${'in $inDays days'} ${defaultTimeFormat.format(date)}';
        } else {
          return 'Tomorrow ${defaultTimeFormat.format(date)}';
        }
      }
    } else {
      final days = now.difference(date);
      if (days.inDays > 5) {
        return defaultFullDateFormat.format(date);
      } else {
        final int inDays = (now.hour > date.hour ||
                (now.hour == date.hour && now.minute >= date.minute))
            ? days.inDays
            : (days.inDays + 1);
        if (inDays > 1) {
          return '${'$inDays days ago'} ${defaultTimeFormat.format(date)}';
        } else {
          return 'Yesterday ${defaultTimeFormat.format(date)}';
        }
      }
    }
  }

  static final DateFormat defaultDateFormat = DateFormat('dd-MM-yyyy');
  static final DateFormat defaultFullDateFormat =
      DateFormat('dd-MM-yyyy HH:mm a');
  static final DateFormat defaultTimeFormat = DateFormat('HH:mm a');

  static String dateToString(DateTime? date) {
    if (date != null) {
      return defaultDateFormat.format(date);
    }
    return "";
  }

  static DateTime? stringToDate(String time) {
    try {
      return defaultDateFormat.parse(time);
    } catch (_) {
      return null;
    }
  }
}
