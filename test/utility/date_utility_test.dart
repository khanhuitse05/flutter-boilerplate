import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/src/utils/date_utility.dart';

/// flutter test test/utils/date_utility_test.dart
void main() {
  group('Format Time With Now (Past)', () {
    test('First Test', () {
      final DateTime fakeNow = DateTime.now();
      //
      final DateTime today = fakeNow.subtract(const Duration(minutes: 1));
      expect(DateUtility.formatTimeWithNow(today),
          'Today ${DateUtility.defaultTimeFormat.format(today)}');
      //
      final DateTime yesterday =
          fakeNow.subtract(const Duration(days: 1, hours: -1));
      expect(DateUtility.formatTimeWithNow(yesterday),
          'Yesterday ${DateUtility.defaultTimeFormat.format(yesterday)}');
      final DateTime yesterday2 =
          fakeNow.subtract(const Duration(days: 1, hours: 1));
      expect(DateUtility.formatTimeWithNow(yesterday2),
          'Yesterday ${DateUtility.defaultTimeFormat.format(yesterday2)}');
      //
      final DateTime nDaysAgo = fakeNow.subtract(const Duration(days: 3));
      expect(DateUtility.formatTimeWithNow(nDaysAgo),
          '3 days ago ${DateUtility.defaultTimeFormat.format(nDaysAgo)}');
      final DateTime nDaysAgo2 =
          fakeNow.subtract(const Duration(days: 4, hours: 1));
      expect(DateUtility.formatTimeWithNow(nDaysAgo2),
          '4 days ago ${DateUtility.defaultTimeFormat.format(nDaysAgo2)}');
      //
      final DateTime longAgo = fakeNow.subtract(const Duration(days: 10));
      expect(DateUtility.formatTimeWithNow(longAgo),
          DateUtility.defaultFullDateFormat.format(longAgo));
    });
  });

  group('Format Time With Now (Feature)', () {
    test('First Test', () {
      final DateTime fakeNow = DateTime.now();
      //
      final DateTime today = fakeNow.add(const Duration(minutes: 1));
      expect(DateUtility.formatTimeWithNow(today),
          'Today ${DateUtility.defaultTimeFormat.format(today)}');
      //
      final DateTime tomorrow = fakeNow.add(const Duration(days: 1, hours: 1));
      expect(DateUtility.formatTimeWithNow(tomorrow),
          'Tomorrow ${DateUtility.defaultTimeFormat.format(tomorrow)}');
      final DateTime tomorrow2 =
          fakeNow.add(const Duration(days: 1, hours: -1));
      expect(DateUtility.formatTimeWithNow(tomorrow2),
          'Tomorrow ${DateUtility.defaultTimeFormat.format(tomorrow2)}');
      //
      final DateTime nDays = fakeNow.add(const Duration(days: 2, hours: 1));
      expect(DateUtility.formatTimeWithNow(nDays),
          'in 2 days ${DateUtility.defaultTimeFormat.format(nDays)}');
      final DateTime nDays2 = fakeNow.add(const Duration(days: 3, hours: -1));
      expect(DateUtility.formatTimeWithNow(nDays2),
          'in 3 days ${DateUtility.defaultTimeFormat.format(nDays2)}');
      //
      final DateTime longAgo = fakeNow.add(const Duration(days: 10));
      expect(DateUtility.formatTimeWithNow(longAgo),
          DateUtility.defaultFullDateFormat.format(longAgo));
    });
  });
}
