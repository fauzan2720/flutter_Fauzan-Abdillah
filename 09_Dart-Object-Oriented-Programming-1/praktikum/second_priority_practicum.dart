import 'course_available.dart';

class Calculator {
  int penjumlahan(int n1, int n2) {
    int result = n1 + n2;
    return result;
  }

  int pengurangan(int n1, int n2) {
    int result = n1 - n2;
    return result;
  }

  int perkalian(int n1, int n2) {
    int result = n1 * n2;
    return result;
  }

  double pembagian(int n1, int n2) {
    double result = n1 / n2;
    return result;
  }
}

class Course {
  final String judul;
  final String? deskripsi;

  Course({
    required this.judul,
    this.deskripsi,
  });
}

class Student {
  final String nama;
  final String kelas;
  final List<Course> daftarCourse;

  Student({
    required this.nama,
    required this.kelas,
    required this.daftarCourse,
  });

  List<Course> tambahCourse(Course course) {
    daftarCourse.add(course);
    print("Course (${course.judul}) berhasil ditambahkan!");
    return daftarCourse;
  }

  List<Course> hapusCourse(Course course) {
    daftarCourse.remove(course);
    print("Course (${course.judul}) berhasil dihapus!");
    return daftarCourse;
  }

  void showAllCourses() {
    print("==================================================================");
    print("Daftar course $nama:");
    for (var course in daftarCourse) {
      print("- ${course.judul} (${course.deskripsi})");
    }
    print("==================================================================");
  }
}

void runCalculator() {
  final Calculator _calculator = Calculator();
  int n1 = 10;
  int n2 = 20;

  print("$n1 + $n2 = ${_calculator.penjumlahan(n1, n2)}");
  print("$n1 - $n2 = ${_calculator.pengurangan(n1, n2)}");
  print("$n1 x $n2 = ${_calculator.perkalian(n1, n2)}");
  print("$n1 / $n2 = ${_calculator.pembagian(n1, n2)}");
}

void runStudent() {
  final Student _student = Student(
    nama: "Fauzan Abdillah",
    kelas: "Kelas A",
    daftarCourse: [courseGit, courseFlutterAnimation, courseStateManagement],
  );

  _student.showAllCourses();

  print("Log:");
  _student.tambahCourse(courseCleanCode);
  _student.hapusCourse(courseGit);

  _student.showAllCourses();
}

void main() {
  runCalculator();
  runStudent();
}
