// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/src/utils/extension.dart';

void main() {
  group('String Extension', () {
    test('Trim url case 1', () {
      expect('http://google.com'.urlTrim(), 'google.com');
    });
    test('Trim url case 2', () {
      expect('http://google.com/'.urlTrim(), 'google.com');
    });
    test('Trim url case 3', () {
      expect('https://www.google.com'.urlTrim(), 'google.com');
    });
    test('Trim url case 4', () {
      expect('https://www.google.com/'.urlTrim(), 'google.com');
    });
  });
}
