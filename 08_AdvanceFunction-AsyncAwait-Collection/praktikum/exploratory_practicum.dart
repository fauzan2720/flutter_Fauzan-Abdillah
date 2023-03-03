class ExploratoryPracticum {
  Future<List<String>> setUniqueList(List<String> data) async {
    List<String> result = [];

    await Future.delayed(Duration(milliseconds: 1000));
    for (String element in data) {
      // -1 artinya element tersebut belum tersedia dalam list result
      if (result.indexOf(element) == -1) {
        await Future.delayed(Duration(milliseconds: 200));
        print("element ($element) belum tersedia");
        result.add(element); // menambahkan element ke list result
        await Future.delayed(Duration(milliseconds: 200));
        print("- berhasil ditambahkan");
      } else {
        await Future.delayed(Duration(milliseconds: 200));
        print("element ($element) sudah tersedia");
        await Future.delayed(Duration(milliseconds: 200));
        print("- tidak ditambahkan");
      }
    }
    return result;
  }

  Future<Map<String, int>> frequencyCounter(List<String> data) async {
    List<String>;

    await Future.delayed(Duration(milliseconds: 1000));
    Map<String, int> result = {};
    for (String element in data) {
      // jika element tersedia dalam data result
      if (result.containsKey(element)) {
        result[element] = (result[element]! + 1); // value +1 dari element ini
        await Future.delayed(Duration(milliseconds: 200));
        print(
            "menambahkan value dari element $element, new value = ${result[element]}");
      } else {
        result.addAll(<String, int>{element: 1}); // menambahkan element baru
        await Future.delayed(Duration(milliseconds: 200));
        print("menambahkan element $element, value = ${result[element]}");
      }
    }

    return result;
  }
}
