# 26_MVVM-Architecture

Tujuan dari struktur MVVM (Model-View-ViewModel) adalah untuk memisahkan antara tampilan (View) dan logika bisnis (ViewModel) serta model/data layer (Model) dalam sebuah aplikasi. Tujuan ini dicapai dengan mengikuti prinsip-prinsip pemisahan tanggung jawab (Separation of Concerns) dan single responsibility principle. Implementasi MVVM yang berhasil saya implementasikan adalah sebagai berikut:

- ``lib/core``: berisi kode yang dapat digunakan di seluruh aplikasi, seperti fungsi atau class yang sering digunakan atau bersifat umum.

- ``lib/model``: berisi definisi model atau data class yang digunakan dalam aplikasi, seperti data model dari response api.

- ``lib/model/repository``: berisi kode yang bertanggung jawab untuk mengambil dan menyimpan data dari sumber data eksternal, seperti database atau API.

- ``lib/model/service``: berisi kode yang digunakan untuk melakukan operasi jaringan atau mengambil data dari API (Integrasi API dengan Http/Dio).

- ``lib/view/pages``: berisi file untuk setiap halaman atau tampilan yang ada dalam aplikasi.

- ``lib/view/widgets``: berisi kode untuk widget yang dapat digunakan secara berulang (reusable).

- ``lib/view_model``: berisi ViewModel yang digunakan untuk mengatur state dan logika bisnis dalam aplikasi.

Dengan mengimplementasikan struktur MVVM, Developer mendapatkan beberapa keuntungan seperti:

1. Reusability (Kemampuan digunakan kembali): Dengan memisahkan antara tampilan, logika bisnis, dan model/data layer, setiap komponen dapat digunakan kembali di berbagai bagian aplikasi, atau bahkan di aplikasi yang berbeda, sehingga mengurangi kode duplikat dan mempercepat proses pengembangan.

2. Maintainability (Kemampuan pemeliharaan): Struktur MVVM memungkinkan pengembang untuk mengubah kode pada satu bagian tanpa mempengaruhi bagian lainnya, sehingga memudahkan proses pemeliharaan dan perbaikan bugs pada aplikasi.

3. Testability (Kemampuan pengujian): Dalam struktur MVVM, ViewModel yang berisi logika bisnis dapat diuji secara terpisah dari tampilan dan model/data layer, sehingga memudahkan pengembang untuk melakukan pengujian dan validasi pada logika bisnis tanpa harus memperhatikan interaksi dengan tampilan atau model.

Sehingga, aplikasi dapat memiliki arsitektur yang baik, yang dapat memperbaiki kualitas dan maintainability kode, serta memudahkan proses pengembangan dan perawatan aplikasi di masa depan.