
import 'package:flutter/material.dart';
import 'package:myapp/src/utils/date/date_helper.dart';

extension DateUtilsExtensions on DateTime {
  int get daysInMonth => DateHelper.daysPerMonth(year)[month - 1];

  DateTime get nextDay => DateTime(year, month, day + 1);

  bool isSameDayOrAfter(DateTime other) => isAfter(other) || isSameDay(other);

  bool isSameDayOrBefore(DateTime other) => isBefore(other) || isSameDay(other);

  bool isSameDay(DateTime other) => DateUtils.isSameDay(this, other);

  DateTime removeTime() => DateTime(year, month, day);

  bool isSameMonth(DateTime other) =>
      other.year == year && other.month == month;

  bool isSameWeek(DateTime other) {
    final difference = this.difference(other).inDays;
    if (difference > 7) {
      return false;
    }
    if (difference == 0) {
      return true;
    }
    if (compareTo(other) > 0) {
      return weekday > other.weekday;
    }
    return weekday < other.weekday;
  }

  bool in7Days(DateTime other) {
    final difference = this.difference(other).inDays;
    return difference < 7;
  }

  DateTime addDays(int daysToAdd) {
    return DateTime(
      year,
      month,
      day + daysToAdd,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  DateTime addDaysWithoutTime(int daysToAdd) {
    return DateTime(
      year,
      month,
      day + daysToAdd,
    );
  }

  DateTime getStartDate() {
    return DateTime(year, month, day);
  }

  DateTime getEndDate() {
    return DateTime(year, month, day + 1).subtract(const Duration(seconds: 1));
  }
}
