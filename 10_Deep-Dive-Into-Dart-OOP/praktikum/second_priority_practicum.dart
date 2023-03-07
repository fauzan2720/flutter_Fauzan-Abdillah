abstract class Matematika {
  void hasil() {
    print("Belum ada hasil");
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  final int x;
  final int y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  void hasil() {
    int fpb = 1;
    int i = 2;

    while (i <= x && i <= y) {
      if (x % i == 0 && y % i == 0) {
        fpb = i;
      }
      i++;
    }

    int kpk = (x * y) ~/ fpb;

    print("KPK dari $x dan $y adalah $kpk");
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  final int x;
  final int y;

  FaktorPersekutuanTerbesar(this.x, this.y);

  @override
  void hasil() {
    int fpb = 1;
    int i = 2;

    while (i <= x && i <= y) {
      if (x % i == 0 && y % i == 0) {
        fpb = i;
      }
      i++;
    }

    print("FPB dari $x dan $y adalah $fpb");
  }
}

void main() {
  int x = 40;
  int y = 100;

  Matematika operation = KelipatanPersekutuanTerkecil(x, y);
  operation.hasil();

  operation = FaktorPersekutuanTerbesar(x, y);
  operation.hasil();
}
