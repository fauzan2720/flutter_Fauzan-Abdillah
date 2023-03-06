# Documentation

## Praktikum Prioritas 1

Program tersebut memiliki 2 kelas, yaitu ``Hewan`` dan ``Mobil``. Kelas ``Hewan`` berisi data atribut berupa nama dan berat hewan. Kelas ``Mobil`` memiliki atribut kapasitas mobil dan list muatan. Kelas ``Mobil`` juga memiliki method ``tambahMuatan`` untuk menambahkan hewan ke dalam list muatan mobil. Program tersebut melakukan simulasi dengan membuat objek ``Mobil`` dengan kapasitas 250 kg, lalu menambahkan 2 hewan ke dalam muatan mobil dengan menggunakan method ``tambahMuatan``. Setelah itu, program menghitung dan menampilkan total berat muatan mobil dengan menggunakan perulangan ``forEach``.

Output:

![output1](https://user-images.githubusercontent.com/74108522/223054729-444f8832-c176-4708-af1a-80c037e0f175.png)

## Praktikum Prioritas 2

Program tersebut terdiri dari tiga kelas yaitu ``Calculator``, ``Course``, dan ``Student``. Kelas ``Calculator`` memiliki empat method untuk melakukan operasi matematika sederhana yaitu ``penjumlahan``, ``pengurangan``, ``perkalian``, dan ``pembagian``. Kelas ``Course`` memiliki dua atribut yaitu ``judul`` dan ``deskripsi`` yang bersifat opsional. Kelas ``Student`` memiliki tiga atribut yaitu ``nama``, ``kelas``, dan ``daftarCourse`` yang merupakan kumpulan dari objek-objek ``Course``.

Fungsi ``runCalculator()`` digunakan untuk memanggil method-method di kelas ``Calculator`` dan menampilkan hasil operasi matematika sederhana.

Fungsi ``runStudent()`` digunakan untuk menginstansiasi objek ``Student`` dan menampilkan daftar course yang dimilikinya dengan memanggil method ``showAllCourses()``. Selanjutnya, fungsi ini menambahkan dan menghapus course dari daftar course dengan memanggil method ``tambahCourse()`` dan ``hapusCourse()``. Terakhir, daftar course di tampilkan kembali dengan memanggil method ``showAllCourses()``.

Fungsi ``main()`` dipanggil untuk menjalankan program secara keseluruhan dengan memanggil fungsi ``runCalculator()`` dan ``runStudent()``.

Output:

![output2](https://user-images.githubusercontent.com/74108522/223054734-857558a3-2bf6-449d-9918-356568521046.png)

## Praktikum Eksplorasi

Kode program tersebut merupakan implementasi dari sebuah aplikasi daftar buku. Terdapat dua kelas yaitu ``Book`` dan ``BookModel``.

``BookModel`` berfungsi sebagai model data untuk sebuah buku dengan atribut seperti ``id``, ``judul``, ``penerbit``, ``harga``, dan ``kategori``.

Sedangkan ``Book`` adalah kelas yang berisi metode untuk menambahkan, menampilkan, dan menghapus buku dari daftar ``dataBuku``. Metode ``tambahkan()`` menambahkan sebuah objek buku ke dalam daftar ``dataBuku``. Metode ``tampilkan()`` menampilkan daftar ``dataBuku`` dalam bentuk teks yang berisi ``id``, ``judul``, ``penerbit``, ``harga``, dan ``kategori`` buku. Metode ``hapus()`` menghapus sebuah objek buku dari daftar ``dataBuku``.

Di dalam fungsi ``main()``, objek ``Book`` dibuat dan digunakan untuk menambahkan lima buku ke dalam daftar ``dataBuku``. Kemudian, daftar ``dataBuku`` ditampilkan, lalu buku nomor 4 dan nomor 2 dihapus dari daftar, dan akhirnya daftar ``dataBuku`` ditampilkan kembali setelah dilakukan penghapusan buku.

Output:

![output3](https://user-images.githubusercontent.com/74108522/223054737-db4c35cf-abb2-4bc9-ab8c-85420758a2ff.png)

