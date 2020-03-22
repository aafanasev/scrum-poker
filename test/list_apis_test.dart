import 'package:flutter_test/flutter_test.dart';
import 'package:scrum_poker/util/list_apis.dart';

void main() {
  test("split into equal parts", () {
    final arr = [1, 2, 3, 4];
    final res = ListUtil.chunk(arr, 2);

    expect(res, [
      [1, 2],
      [3, 4]
    ]);
  });

  test("split into not equal parts", () {
    final arr = [1, 2, 3, 4];
    final res = ListUtil.chunk(arr, 3);

    expect(res, [
      [1, 2, 3],
      [4]
    ]);
  });

  test("chunk size equals to collection size", () {
    final arr = [1, 2, 3, 4];
    final res = ListUtil.chunk(arr, 4);

    expect(res, [
      [1, 2, 3, 4]
    ]);
  });

  test("chunk with negative number throws exception", () {
    final arr = [1, 2, 3, 4];

    expect(() => ListUtil.chunk(arr, -1), throwsAssertionError);
  });
}
