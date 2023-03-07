abstract class Shape {
  int getArea() {
    print("Belum ada data untuk dihitung");
    return 0;
  }

  int getPerimeter() {
    print("Belum ada data untuk dihitung");
    return 0;
  }
}

class Circle implements Shape {
  final int radius;
  Circle({required this.radius});

  @override
  int getArea() {
    double result = 3.14 * radius * radius;
    return result.toInt();
  }

  @override
  int getPerimeter() {
    double result = 2 * 3.14 * radius;
    return result.toInt();
  }
}

class Square implements Shape {
  final int side;
  Square({required this.side});

  @override
  int getArea() {
    int result = side * side;
    return result;
  }

  @override
  int getPerimeter() {
    int result = 4 * side;
    return result;
  }
}

class Rectangle implements Shape {
  final int width;
  final int height;
  Rectangle({required this.width, required this.height});

  @override
  int getArea() {
    int result = width * height;
    return result;
  }

  @override
  int getPerimeter() {
    int result = 2 * (width + height);
    return result;
  }
}

void main() {
  final Circle circle = Circle(radius: 7);
  final Square square = Square(side: 5);
  final Rectangle rectangle = Rectangle(width: 4, height: 6);

  print("Luas lingkaran: ${circle.getArea()}");
  print("Keliling lingkaran: ${circle.getPerimeter()}");

  print("Luas persegi: ${square.getArea()}");
  print("Keliling persegi: ${square.getPerimeter()}");

  print("Luas persegi panjang: ${rectangle.getArea()}");
  print("Keliling persegi panjang: ${rectangle.getPerimeter()}");
}
