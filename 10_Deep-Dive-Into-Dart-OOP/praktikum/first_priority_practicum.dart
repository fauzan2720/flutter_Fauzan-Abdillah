class BangunRuang {
  final int? panjang;
  final int? lebar;
  final int? tinggi;

  BangunRuang({
    this.panjang,
    this.lebar,
    this.tinggi,
  });

  void volume() {
    print("Tidak ada data untuk dihitung");
  }
}

class Kubus extends BangunRuang {
  final int sisi;

  Kubus({
    required this.sisi,
  });

  @override
  void volume() {
    int result = sisi * sisi * sisi;
    print("volume kubus = sisi x sisi x sisi");
    print("             = $sisi x $sisi x $sisi");
    print("             = $result");
  }
}

class Balok extends BangunRuang {
  Balok({
    required super.panjang,
    required super.lebar,
    required super.tinggi,
  });

  @override
  void volume() {
    int result = panjang! * lebar! * tinggi!;
    print("volume balok = panjang x lebar x tinggi");
    print("             = $panjang x $lebar x $tinggi");
    print("             = $result");
  }
}

void main() {
  final Kubus kubus = Kubus(sisi: 20);
  final Balok balok = Balok(panjang: 8, lebar: 12, tinggi: 16);

  kubus.volume();
  balok.volume();
}
