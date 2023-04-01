# 20_Flutter-State-Management-(Provider)

Provider bekerja dengan memanfaatkan konsep ``InheritedWidget``, sebuah widget yang memungkinkan kita untuk membagikan data ke dalam hierarki widget. Ketika ada perubahan pada state, Provider akan memberitahu semua widget yang menggunakan state tersebut agar dapat diperbarui secara otomatis.

Provider memiliki beberapa fitur yang berguna untuk membantu mengelola state pada aplikasi Flutter. Beberapa fitur tersebut adalah:

1. ``ChangeNotifier``: adalah kelas yang dapat mengubah state dan memberitahu perubahan tersebut kepada widget yang menggunakannya. Ketika terdapat perubahan pada state, ChangeNotifier akan memberitahu widget yang menggunakan state tersebut untuk melakukan update tampilan.

2. ``notifyListeners()``: adalah untuk memberitahu semua listener (widget) yang terhubung dengan provider bahwa ada perubahan pada data yang disediakan oleh provider. Ketika fungsi notifyListeners() dipanggil, semua listener (widget) yang terhubung dengan provider akan memperbarui tampilan (widget) sesuai dengan data terbaru yang disediakan oleh provider.

3. ``Provider``: adalah widget yang digunakan untuk memasukkan state ke dalam widget tree dan memungkinkan widget lain mengaksesnya.

4. ``Provider.of()``: digunakan untuk mengambil nilai state yang disediakan oleh provider. Namun, penggunaan Provider.of() tidak disarankan jika hanya ingin mengakses nilai state, karena akan menyebabkan seluruh widget yang menggunakan provider untuk diperbarui kembali. Sebaiknya, gunakan Consumer untuk mengoptimalkan performa aplikasi.

5. ``Consumer``: adalah widget yang digunakan untuk menampilkan widget yang bergantung pada nilai state dari provider. Consumer akan melakukan rebuild pada widget yang terdapat di dalamnya ketika terjadi perubahan pada state yang diambil dari provider.

6. ``context.watch<T>()``: membuat widget mendengarkan perubahan pada T, akan merender ulang seluruh widget yang terdapat pada Widget build().

7. ``context.read<T>()``: mengembalikan T tanpa mendengarkannya, akan mendengarkan suatu widget yang bungkus dengan widget Consumer.