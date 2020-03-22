class ListUtil {
  static List<List<T>> chunk<T>(List<T> list, int number) {
    assert(number > 0);

    List<List<T>> result = [];

    for (var i = 0; i < list.length; i += number) {
      var endIndex = i + number;
      if (endIndex > list.length) {
        endIndex = list.length;
      }
      result.add(list.sublist(i, endIndex));
    }

    return result;
  }
}
