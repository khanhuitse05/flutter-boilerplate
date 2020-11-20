import 'package:flutter_test/flutter_test.dart';
import 'package:ping9/ping9.dart';

void main() {
  test('To Upper Case First', () {
    final result = 'abc'.toUpperCaseFirst();
    expect(result, 'Abc');
  });
}
