void main() {
  double _sisi = 12.5;
  double _panjang = 6.0;
  double _lebar = 8.75;
  double _radius = 7.0;

  // cetak hasil keliling dan luas persegi
  print("Keliling Persegi         ==> ${kelilingPersegi(_sisi)}");
  print("Luas Persegi             ==> ${luasPersegi(_sisi)}");

  // cetak hasil keliling dan luas persegi panjang
  print(
      "Keliling Persegi Panjang ==> ${kelilingPersegiPanjang(_panjang, _lebar)}");
  print("Luas Persegi Panjang     ==> ${luasPersegiPanjang(_panjang, _lebar)}");

  // cetak hasil keliling dan luas lingkaran
  print("Keliling Lingkaran       ==> ${kelilingLingkaran(_radius)}");
  print("Luas Lingkaran           ==> ${luasLingkaran(_radius)}");
}

double kelilingPersegi(double sisi) {
  double result = 4 * sisi;
  return result;
}

double luasPersegi(double sisi) {
  double result = sisi * sisi;
  return result;
}

double kelilingPersegiPanjang(double panjang, double lebar) {
  double result = 2 * (panjang + lebar);
  return result;
}

double luasPersegiPanjang(double panjang, double lebar) {
  double result = panjang * lebar;
  return result;
}

double kelilingLingkaran(double radius) {
  double result = 2 * 3.14 * radius;
  return result;
}

double luasLingkaran(double radius) {
  double result = 3.14 * radius * radius;
  return result;
}
