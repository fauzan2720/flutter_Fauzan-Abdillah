class ExploratoryPracticum {
  List<String> setUniqueList(List<String> data) {
    List<String> result = [];
    for (String element in data) {
      // -1 artinya element tersebut belum tersedia dalam list result
      if (result.indexOf(element) == -1) {
        print("element ($element) belum tersedia");
        result.add(element); // menambahkan element ke list result
        print("- berhasil ditambahkan");
      } else {
        print("element ($element) sudah tersedia");
        print("- tidak ditambahkan");
      }
    }
    return result;
  }

  Map<String, int> frequencyCounter(List<String> data) {
    List<String>;

    Map<String, int> result = {};
    for (String element in data) {
      // jika element tersedia dalam data result
      if (result.containsKey(element)) {
        result[element] = (result[element]! + 1); // value +1 dari element ini
        print(
            "menambahkan value dari element $element, new value = ${result[element]}");
      } else {
        result.addAll(<String, int>{element: 1}); // menambahkan element baru
        print("menambahkan element $element, value = ${result[element]}");
      }
    }

    return result;
  }
}
