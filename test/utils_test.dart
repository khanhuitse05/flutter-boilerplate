import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/src/utils/utils.dart';

void main() {
  group('Test splice list', () {
    test('description', () {
      List<int> list = [1, 2, 3, 4];
      expect(Utils.splice(list, 1), [
        [1],
        [2],
        [3],
        [4]
      ]);
      expect(Utils.splice(list, 2), [
        [1, 2],
        [3, 4]
      ]);
      expect(Utils.splice(list, 3), [
        [1, 2, 3],
        [4]
      ]);
      expect(Utils.splice(list, 4), [
        [1, 2, 3, 4]
      ]);
      expect(Utils.splice(list, 5), [
        [1, 2, 3, 4]
      ]);
    });
  });
}
