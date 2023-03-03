import 'exploratory_practicum.dart';
import 'first_priority_practicum.dart';
import 'second_priority_practicum.dart';

final _firstPriorityPracticum = FirstPriorityPracticum();
final _secondPriorityPracticum = SecondPriorityPracticum();
final _exploratoryPracticum = ExploratoryPracticum();

List<int> _listNumber = [7, 5, 3, 5, 2, 1];

List<String> _listData = [
  "amuse",
  "tommy kaira",
  "spoon",
  "HKS",
  "litchfield",
  "amuse",
  "HKS"
];

List<String> _programmingLanguage = [
  "js",
  "js",
  "js",
  "golang",
  "python",
  "js",
  "js",
  "golang",
  "rust"
];

void main() async {
  print("* Praktikum Prioritas 1");
  _createLine();
  final result = await _firstPriorityPracticum.multiplyList(_listNumber, 5);
  print("result: $result");
  _createLine();

  print("\n* Praktikum Prioritas 2");
  _createLine();
  final result2 = await _secondPriorityPracticum.listToMap();
  print("Hasil perubahan list ke map: $result2");
  _createLine();
  final result3 = await _secondPriorityPracticum.calculateAverage(_listNumber);
  print("Hasil rata-rata: $result3");
  _createLine();
  final result4 = await _secondPriorityPracticum.factorial(5);
  print("Hasil faktorial dari 5 adalah $result4");
  _createLine();

  print("\n* Praktikum Eksplorasi");
  _createLine();
  final result5 = await _exploratoryPracticum.setUniqueList(_listData);
  print("Hasil list yang di set unik: $result5");
  _createLine();

  final result6 =
      await _exploratoryPracticum.frequencyCounter(_programmingLanguage);
  print(
      "Frekuensi kemunculan bahasa pemrograman: ${result6.toString().replaceAll("{", "").replaceAll("}", "")}");
  _createLine();
}

void _createLine() {
  print("====================================================================");
}
