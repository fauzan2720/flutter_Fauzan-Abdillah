class SecondPriorityPracticum {
  Future<Map<int, String>> listToMap() async {
    List<List<dynamic>> listData = [
      [1, "one"],
      [2, "two"],
      [3, "three"],
      [4, "four"],
      [5, "five"]
    ];

    await Future.delayed(Duration(milliseconds: 1000));
    print("list data = $listData");

    Map<int, String> mapData = {};

    listData.forEach(
      (element) => mapData.addAll(
        <int, String>{
          element[0]: element[1]
        }, // mengubah list menjadi map bertipe <int, string>
      ),
    );

    return mapData;
  }

  Future<int> calculateAverage(List<int> data) async {
    int total = 0;
    double resultAverage;
    int resultRounding;

    for (int element in data) {
      total += element; // menjumlahkan setiap element
    }

    await Future.delayed(Duration(milliseconds: 1000));
    print("Total = $total");

    await Future.delayed(Duration(milliseconds: 200));
    print("Banyak data = ${data.length}");

    await Future.delayed(Duration(milliseconds: 200));
    resultAverage = total / data.length; // RUMUS: total data / banyak data
    resultRounding = resultAverage.ceil(); // dibulatkan keatas
    print("Rata-rata = $total / ${data.length} = $resultAverage");

    return resultRounding;
  }

  Future<BigInt> factorial(int n) async {
    // menggunakan BigInt, karna hasil kemungkinan melebihi batas nilai integer
    BigInt result = BigInt.one;
    String log = '';

    if (n == 0) {
      return result;
    } else {
      // rumus n! = n * (n-1) * (n-2) * ... * 3 * 2 * 1
      for (int i = n; i >= 1; i--) {
        result *= BigInt.parse(i.toString());

        // create log
        if (i == 1) {
          log += "${i.toString()} = $result";
        } else {
          log += i.toString() + " x ";
        }
      }

      await Future.delayed(Duration(milliseconds: 1000));
      print(log);

      return result;
    }
  }
}
