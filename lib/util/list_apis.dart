class ListUtil {
  static List<List> chunk(List list, int number) {
    var result = [];

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
