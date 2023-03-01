# Documentation

## Class FirstPriorityPracticum

Fungsi ``multiplyList`` menerima dua parameter, yaitu data yang merupakan ``list integer`` dan ``multiplier`` yang merupakan integer sebagai pengali.

Kemudian, fungsi akan membuat list baru ``result`` yang akan menyimpan hasil perkalian tiap elemen data dengan multiplier.

Selanjutnya, dilakukan perulangan menggunakan ``for`` pada data secara ``asynchronous`` menggunakan ``await Future.delayed``. Pada setiap iterasi, nilai tiap elemen pada data akan dikalikan dengan `multiplier` menggunakan operator ``*``.

Hasil perkalian tersebut kemudian dimasukkan ke dalam ``list result`` menggunakan method ``add``.

Setelah selesai melakukan perulangan, fungsi akan mengembalikan ``list result`` sebagai hasil dari fungsi.

## Class SecondPriorityPracticum

Pada class ini terdapat beberapa fungsi di dalamnya:

1. Fungsi ``listToMap()``: berfungsi untuk mengubah list menjadi map dengan key bertipe integer dan value bertipe string. 

2. Fungsi ``calculateAverage()``: berfungsi untuk menghitung rata-rata dari sebuah list data yang berisi integer, dengan menghitung total dari seluruh elemen, kemudian dibagi dengan banyaknya elemen pada list tersebut.

3. Fungsi ``factorial()``: berfungsi untuk menghitung faktorial dari sebuah bilangan, dengan menggunakan loop untuk mengalikan bilangan tersebut dengan bilangan-bilangan sebelumnya, hingga mencapai 1. Hasil faktorial dikeluarkan dalam bentuk BigInt, karna hasilnya dapat melebihi batas nilai integer.

Selain itu, pada setiap fungsi terdapat proses untuk mencetak output nilai-nilai variabel untuk memberikan informasi kepada pengguna mengenai nilai dari setiap proses yang dilakukan.

## Class ExploratoryPracticum

Terdapat 2 fungsi:

1. Fungsi ``setUniqueList`` menerima sebuah list ``data`` yang berisi elemen bertipe string dan akan mengembalikan sebuah list yang hanya terdiri dari elemen-elemen unik yang ada di dalam ``data``. Dalam fungsi ini, dilakukan iterasi pada setiap elemen di dalam ``data`` dan dicek apakah elemen tersebut sudah ada dalam ``result`` atau belum menggunakan metode ``indexOf``. Jika belum ada, maka elemen tersebut akan ditambahkan ke dalam ``result``.

2. Fungsi ``frequencyCounter`` menerima sebuah list ``data`` yang berisi elemen bertipe string dan akan mengembalikan sebuah Map yang berisi frekuensi dari masing-masing elemen yang ada di dalam ``data``. Dalam fungsi ini, dilakukan iterasi pada setiap elemen di dalam ``data``. Jika elemen tersebut sudah ada dalam ``result``, maka value dari elemen tersebut akan diincrement. Jika belum ada, maka elemen baru akan ditambahkan ke dalam ``result`` dengan value awal 1.

## Fungsi main()

Terdapat ada tiga variabel ``_firstPriorityPracticum``, ``_secondPriorityPracticum``, dan ``_exploratoryPracticum`` yang digunakan untuk membuat objek dari masing-masing kelas. Kemudian tiga variabel lainnya ``_listNumber``, ``_listData``, dan ``_programmingLanguage`` digunakan untuk menyimpan data dalam bentuk list yang akan diproses di praktikum. Tanda ``_`` pada penamaan variabel di awal artinya data tersebut bersifat privat dan hanya dapat diakses dari dalam file yang sama.

Fungsi ``main()`` dijalankan untuk mengeksekusi tugas-tugas praktikum. Pertama-tama, tugas praktikum prioritas satu dijalankan dengan memanggil fungsi ``multiplyList()`` dari kelas ``FirstPriorityPracticum`` untuk mengalikan isi list ``_listNumber`` dengan angka lima. Kemudian hasilnya dicetak.

Selanjutnya, tugas praktikum prioritas dua dijalankan dengan memanggil tiga fungsi yang berbeda dari kelas ``SecondPriorityPracticum``. Pertama-tama, fungsi ``listToMap()`` dipanggil untuk mengubah list menjadi map. Kemudian fungsi ``calculateAverage()`` digunakan untuk menghitung rata-rata dari isi list ``_listNumber``. Terakhir, fungsi ``factorial()`` digunakan untuk menghitung faktorial dari angka lima.

Terakhir, tugas praktikum eksplorasi dijalankan dengan memanggil dua fungsi dari kelas ``ExploratoryPracticum``. Pertama, fungsi ``setUniqueList()`` dipanggil untuk menghapus elemen yang duplikat dari list ``_listData``. Kemudian fungsi ``frequencyCounter()`` digunakan untuk menghitung frekuensi kemunculan dari elemen dalam list ``_programmingLanguage``.

Setiap kali sebelum dan sesudah mengeksekusi tugas praktikum, fungsi ``_createLine()`` dipanggil untuk mencetak garis pemisah.

## Output

![output1](https://user-images.githubusercontent.com/74108522/222112019-0bcfdc12-089f-4c0b-9281-813457e19cf4.png)

![output2](https://user-images.githubusercontent.com/74108522/222112028-9e09166f-f373-478a-8dc7-8199c2dc6a66.png)

![output3](https://user-images.githubusercontent.com/74108522/222112031-a30fee06-0795-46c9-bd81-c20891bf8c3c.png)

