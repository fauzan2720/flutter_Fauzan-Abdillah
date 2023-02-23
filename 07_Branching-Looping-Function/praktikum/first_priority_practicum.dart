class FirstPriorityPracticum {
  void getGrade(int grade) {
    if (grade > 70) {
      return print("Nilai A");
    } else if (grade > 40) {
      return print("Nilai B");
    } else if (grade > 0) {
      return print("Nilai C");
    } else {
      return print("");
    }
  }

  void looping(int minValue, int maxValue) {
    for (int i = minValue; i <= maxValue; i++) {
      print(i);
    }
  }
}
