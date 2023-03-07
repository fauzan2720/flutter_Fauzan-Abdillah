# Documentation

## Praktikum Prioritas 1

Praktikum ini merupakan implementasi dari pewarisan atau inheritance. Terdapat dua kelas turunan yang mewarisi sifat dari kelas induk atau parent class yaitu ``Kubus`` dan ``Balok``. Kelas ``BangunRuang`` sebagai parent class memiliki atribut ``panjang``, ``lebar``, dan ``tinggi``, serta sebuah method ``volume()`` yang tidak memiliki implementasi dan hanya menampilkan pesan "Tidak ada data untuk dihitung".

Sedangkan pada kelas turunan ``Kubus`` dan ``Balok`` memiliki implementasi method ``volume()`` yang menghitung volume bangun ruang sesuai dengan rumus yang berlaku, yakni ``volume kubus = sisi x sisi x sisi`` dan ``volume balok = panjang x lebar x tinggi``.

Di dalam fungsi main(), objek ``kubus`` dan ``balok`` dibuat dengan menggunakan konstruktor dari kelas ``Kubus`` dan ``Balok`` dengan mengisi nilai pada parameter konstruktor ``sisi``, ``panjang``, ``lebar``, dan ``tinggi``. Setelah itu, method ``volume()`` dipanggil untuk menampilkan hasil perhitungan volume masing-masing bangun ruang.

Output:

![output1](https://user-images.githubusercontent.com/74108522/223325571-ed5aa2af-fc3f-4a10-8803-ee8e50db6268.png)

## Praktikum Prioritas 2

Praktikum ini memiliki 3 kelas: ``Matematika`` sebagai kelas induk, ``KelipatanPersekutuanTerkecil`` dan ``FaktorPersekutuanTerbesar`` sebagai kelas turunan yang mengimplementasikan metode ``hasil()`` dari kelas induk.

Kelas ``KelipatanPersekutuanTerkecil`` menghitung KPK dari 2 bilangan yang diinputkan, sedangkan kelas ``FaktorPersekutuanTerbesar`` menghitung FPB dari 2 bilangan tersebut.

Pada fungsi ``main()``, pertama-tama dibuat objek ``operation`` dengan kelas ``KelipatanPersekutuanTerkecil`` dan dijalankan metode ``hasil()``, lalu dibuat objek ``operation`` dengan kelas ``FaktorPersekutuanTerbesar`` dan dijalankan metode ``hasil()``. Hasil kedua metode tersebut akan ditampilkan pada console.

Output:

![output2](https://user-images.githubusercontent.com/74108522/223325574-1470e392-39d0-4594-b839-2bf242f8145a.png)

## Praktikum Eksplorasi

Praktikum ini merupakan implementasi dari sebuah abstract class ``Shape`` yang memiliki dua method yaitu ``getArea()`` dan ``getPerimeter()`` untuk menghitung luas dan keliling suatu bangun datar.

Selanjutnya terdapat tiga class yang meng-extend class ``Shape`` yaitu ``Circle``, ``Square``, dan ``Rectangle``. Ketiga class ini memiliki atribut yang berbeda-beda, tetapi mengimplementasikan kembali method ``getArea()`` dan ``getPerimeter()`` dari class ``Shape``.

Pada fungsi main, program membuat objek dari masing-masing class ``Circle``, ``Square``, dan ``Rectangle``. Kemudian objek-objek tersebut dipanggil method ``getArea()`` dan ``getPerimeter()`` nya untuk menghitung luas dan keliling dari masing-masing bangun datar. Output dari program adalah nilai luas dan keliling dari lingkaran, persegi, dan persegi panjang.

Output:

![output3](https://user-images.githubusercontent.com/74108522/223325575-06701996-c93c-4266-a903-7f2484dac978.png)
