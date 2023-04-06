# 23_Storage

### A. Implementasi Session Login menggunakan Shared Preferences

1. Fungsi ``await SharedPreferences.getInstance()`` digunakan untuk mengambil instance dari Shared Preferences pada aplikasi Flutter. Dengan menggunakan await, aplikasi akan menunggu hingga instance SharedPreferences siap digunakan sebelum melanjutkan eksekusi kode berikutnya.

2. Fungsi ``box.getString`` digunakan untuk mengambil nilai string dari box dengan kunci (key) tertentu.

3. Fungsi ``box.setString`` digunakan untuk menyimpan nilai string pada box dengan kunci tertentu. Nilai yang disimpan dapat diambil kembali dengan menggunakan fungsi box.getString.

4. Fungsi ``box.clear()`` digunakan untuk menghapus semua data yang tersimpan pada box. Fungsi ini berguna untuk membersihkan box sebelum menyimpan data baru atau untuk membersihkan data yang tidak diperlukan.

### B. Implementasi CRUD menggunakan sqflite

1. Fungsi ``db.execute()`` digunakan untuk mengeksekusi query SQL tanpa hasil (void) seperti CREATE, INSERT, DELETE, dan UPDATE. Pada kode program ini, fungsi tersebut digunakan untuk membuat tabel 'contacts' dengan kolom-kolom yang dibutuhkan.

2. Fungsi ``db.query()`` digunakan untuk mengeksekusi query SELECT dan mengembalikan hasil dalam bentuk List<Map<String, dynamic>>. Pada kode program ini, fungsi tersebut digunakan untuk mengambil data dari tabel 'contacts'.

3. Fungsi ``db.insert()`` digunakan untuk mengeksekusi query INSERT dan menyimpan data baru ke dalam tabel. Pada kode program ini, fungsi tersebut digunakan untuk menyimpan data kontak baru ke dalam tabel 'contacts'.

4. Fungsi ``db.update()`` digunakan untuk mengeksekusi query UPDATE dan mengubah data yang sudah ada di dalam tabel. Pada kode program ini, fungsi tersebut digunakan untuk mengubah data kontak yang sudah ada di dalam tabel 'contacts'.

5. Fungsi ``db.delete()`` digunakan untuk mengeksekusi query DELETE dan menghapus data dari tabel. Pada kode program ini, fungsi tersebut digunakan untuk menghapus data kontak dari tabel 'contacts' berdasarkan id kontak yang dihapus.