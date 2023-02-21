void main() {
  String _firstName = "Fauzan";
  String _middleName = "FA";
  String _lastName = "Abdillah";

  String fullName = "Fullname: $_firstName $_middleName $_lastName";
  print(fullName);

  double _radius = 5.0;
  double _tinggi = 10.0;

  print("Volume of Cylinder: ${volumeOfCylinder(_radius, _tinggi)}");
}

double volumeOfCylinder(double radius, double tinggi) {
  double result = 3.14 * radius * radius * tinggi;
  return result;
}
