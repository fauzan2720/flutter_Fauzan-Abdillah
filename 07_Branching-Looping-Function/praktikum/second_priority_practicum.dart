class SecondPriorityPracticum {
  void showStarPyramid(int rows) {
    String result = '';

    for (int i = 1; i <= rows; i++) {
      for (int j = 1; j <= rows - i; j++) {
        // membuat spasi untuk piramida
        result += "  ";
      }

      for (int k = 1; k <= 2 * i - 1; k++) {
        // membuat bintang untuk piramida
        result += "* ";
      }
      result += "\n";
    }

    return print(result);
  }

  void showHourglass(int rows) {
    String result = '';

    // tampilkan dari terbesar ke terkecil
    for (int i = rows; i > 1; i--) {
      for (int j = 1; j <= rows - i; j++) {
        result += " ";
      }

      for (int k = 1; k <= 2 * i - 1; k++) {
        result += "0";
      }
      result += "\n";
    }

    // tampilkan dari terkecil ke terbesar
    for (int i = 1; i <= rows; i++) {
      for (int j = 1; j <= rows - i; j++) {
        result += " ";
      }

      for (int k = 1; k <= 2 * i - 1; k++) {
        result += "0";
      }
      result += "\n";
    }

    return print(result);
  }

  void factorial(int n) {
    // menggunakan BigInt, karna hasil kemungkinan melebihi batas nilai integer
    BigInt result = BigInt.one;

    if (n == 0) {
      return print("Faktorial dari $n adalah $result");
    } else {
      // rumus n! = n * (n-1) * (n-2) * ... * 3 * 2 * 1
      for (int i = n; i >= 1; i--) {
        result *= BigInt.parse(i.toString());
      }

      return print("Faktorial dari $n adalah $result");
    }
  }

  void circleArea(double radius) {
    double result = 3.14 * radius * radius;
    return print("\nLuas lingkaran dengan jari-jari $radius adalah $result");
  }
}
