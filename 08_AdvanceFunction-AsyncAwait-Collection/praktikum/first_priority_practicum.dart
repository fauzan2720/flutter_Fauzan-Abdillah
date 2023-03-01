class FirstPriorityPracticum {
  Future<List<int>> multiplyList(List<int> data, int multiplier) async {
    print("list data = $data");
    print("pengali = $multiplier");

    List<int> result = [];
    for (int i = 0; i < data.length; i++) {
      int multiplied = await Future.delayed(Duration(milliseconds: 200), () {
        int resMultiplication = data[i] * multiplier;
        print("${data[i]} x $multiplier = $resMultiplication");

        return resMultiplication;
      });
      result.add(multiplied);
    }
    return result;
  }
}
