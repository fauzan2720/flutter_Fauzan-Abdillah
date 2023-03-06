class Hewan {
  final String nama;
  final int berat;

  Hewan({
    required this.nama,
    required this.berat,
  });
}

class Mobil {
  final int kapasitas; // satuan kg

  Mobil({required this.kapasitas});

  List<Hewan> muatan = [
    Hewan(nama: 'Kucing', berat: 10),
    Hewan(nama: 'Kambing Jantan', berat: 110),
    Hewan(nama: 'Kambing Betina', berat: 90),
  ];

  void tambahMuatan(Hewan hewan) {
    int totalMuatanSekarang = hewan.berat;

    // jumlahkan total muatannya dari list muatan sekarang
    muatan.forEach((element) => totalMuatanSekarang += element.berat);

    // jika total muatan masih tersisa, maka akan menambahkan muatan baru
    if (totalMuatanSekarang < kapasitas) {
      muatan.add(hewan);
      print("(!) Muatan ${hewan.nama} ditambahkan");
    } else {
      print("(!) Muatan ${hewan.nama} tidak mencukupi");
    }
  }
}

void main() {
  int kapasitas = 250; // satuan kg
  int totalMuatan = 0;
  final Mobil _mobil = Mobil(kapasitas: kapasitas);

  Hewan muatanBaru = Hewan(nama: 'Anjing', berat: 30);
  Hewan muatanBaru2 = Hewan(nama: 'Kucing garong', berat: 30);
  _mobil.tambahMuatan(muatanBaru);
  _mobil.tambahMuatan(muatanBaru2);

  _mobil.muatan.forEach((element) {
    totalMuatan += element.berat;
    print("${element.nama}: ${element.berat}kg");
  });

  print("Kapasitas mobil = $kapasitas kg");
  print("Muatan mobil = $totalMuatan kg");
}
