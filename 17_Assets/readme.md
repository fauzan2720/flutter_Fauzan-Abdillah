# 17_Assets

1. Image Asset: adalah gambar yang diletakkan pada folder "assets" di dalam proyek Flutter. Untuk menampilkan gambar asset pada aplikasi, digunakan widget ``Image.asset()``. Syarat untuk menggunakan gambar asset adalah file gambar harus diletakkan pada folder "assets" dan sudah didefinisikan di file pubspec.yaml.

2. Image Network: adalah gambar yang diambil dari internet dengan menggunakan URL. Widget yang digunakan untuk menampilkan gambar dari jaringan atau internet adalah ``Image.network()``. Syarat untuk menggunakan gambar dari jaringan adalah URL gambar harus valid dan dapat diakses.

3. Image File: adalah gambar yang diambil dari sistem file. Widget yang digunakan untuk menampilkan gambar dari sistem file adalah ``Image.file()``. Syarat untuk menggunakan gambar dari sistem file adalah path atau alamat file harus valid dan dapat diakses.

4. Google Font Lokal: adalah font yang dapat diunduh dan digunakan secara lokal di dalam aplikasi Flutter. Untuk menggunakan Google Font Lokal, kita perlu mendownload font dari Google Fonts dan meletakkannya pada folder "fonts" di dalam proyek. Syarat untuk menggunakan Google Font Lokal adalah font sudah diletakkan pada folder "fonts" dan sudah didefinisikan di file pubspec.yaml.

5. Google Fonts dari Dependency: adalah font yang disediakan oleh package dependency. Package dependency adalah kumpulan file yang disediakan oleh pihak ketiga dan dapat diunduh dan digunakan dalam pembuatan aplikasi Flutter. Untuk menggunakan Google Fonts dari Dependency, kita perlu menambahkan package dependency pada file pubspec.yaml dan memanggil font pada kode. Syarat untuk menggunakan Google Fonts dari Dependency adalah package sudah didefinisikan di file pubspec.yaml dan font sudah dipanggil pada kode.
