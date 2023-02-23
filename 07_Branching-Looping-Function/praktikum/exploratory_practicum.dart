import 'dart:io';

class ExploratoryPracticum {
  void checkPrimeNumber() {
    stdout.write("Masukkan sebuah bilangan: ");
    int bilangan = int.parse(stdin.readLineSync()!);
    bool prima = true;

    if (bilangan < 2) {
      prima = false;
    } else {
      for (int i = 2; i < bilangan; i++) {
        if (bilangan % i == 0) {
          prima = false;
          break;
        }
      }
    }

    if (prima) {
      print("bilangan prima\n");
    } else {
      print("bukan bilangan prima\n");
    }
  }

  void multiplicationTable() {
    stdout.write("Masukkan sebuah bilangan perkalian: ");
    int n = int.parse(stdin.readLineSync()!);

    String result = '';

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= n; j++) {
        result += "${i * j}\t";
      }
      result += "\n";
    }

    return print(result);
  }
}
