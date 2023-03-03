class FirstPriorityPracticum {
  Future<List<int>> multiplyList(List<int> data, int multiplier) async {
    print("list data = $data");
    print("pengali = $multiplier");

    List<int> result = [];
    for (int element in data) {
      int multiplied = await Future.delayed(Duration(milliseconds: 200), () {
        int resMultiplication = element * multiplier;
        print("$element x $multiplier = $resMultiplication");

        return resMultiplication;
      });
      result.add(multiplied);
    }
    return result;
  }
}
