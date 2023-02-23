import 'exploratory_practicum.dart';
import 'first_priority_practicum.dart';
import 'second_priority_practicum.dart';

void main() {
  int _grade = 99;
  int _minValue = 1;
  int _maxValue = 10;

  final FirstPriorityPracticum firstPriorityPracticum =
      FirstPriorityPracticum();
  final SecondPriorityPracticum secondPriorityPracticum =
      SecondPriorityPracticum();
  final ExploratoryPracticum exploratoryPracticum = ExploratoryPracticum();

  print("\n========== First Priority Practicum ==========\n");

  firstPriorityPracticum.getGrade(_grade);
  print("\n");
  firstPriorityPracticum.looping(_minValue, _maxValue);

  print("\n========== Second Priority Practicum ==========\n");

  secondPriorityPracticum.showStarPyramid(9);
  secondPriorityPracticum.showHourglass(9);
  secondPriorityPracticum.factorial(10);
  secondPriorityPracticum.factorial(40);
  secondPriorityPracticum.factorial(50);
  secondPriorityPracticum.circleArea(8);

  print("\n========== Exploratory Practicum ==========\n");

  exploratoryPracticum.checkPrimeNumber();
  exploratoryPracticum.checkPrimeNumber();
  exploratoryPracticum.multiplicationTable();
}
