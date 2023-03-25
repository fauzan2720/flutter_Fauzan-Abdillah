# 19_Flutter-Navigation

## [Praktikum](https://github.com/fauzan2720/flutter_Fauzan-Abdillah/tree/main/17_Assets/praktikum)

## [Screenshots](https://github.com/fauzan2720/flutter_Fauzan-Abdillah/tree/main/17_Assets/screenshots)

## Summary

Navigation pada Flutter mengacu pada kemampuan aplikasi untuk berpindah dari satu halaman ke halaman lainnya. Ada beberapa cara untuk melakukan navigasi di Flutter, yaitu:

Navigation dengan menggunakan widget ``Navigator``: widget ini memungkinkan pengguna untuk berpindah ke halaman lain dengan menekan tombol atau widget tertentu. Navigator menyediakan metode untuk menambahkan, menghapus atau menavigasi antar halaman.

Navigation dengan menggunakan widget ``TabBar``: widget ini memungkinkan pengguna untuk menavigasi antar halaman dengan menekan tab. TabBar dapat digunakan untuk mengatur dan menampilkan konten pada halaman yang berbeda.

Navigation dengan menggunakan widget ``Drawer``: widget ini memungkinkan pengguna untuk menavigasi antar halaman dengan membuka menu geser pada bagian kiri atau kanan layar. Drawer sering digunakan untuk menampilkan menu navigasi aplikasi.

Navigation dengan menggunakan widget ``BottomNavigationBar``: widget ini memungkinkan pengguna untuk menavigasi antar halaman dengan menekan tombol navigasi pada bagian bawah layar. BottomNavigationBar sering digunakan untuk menampilkan navigasi utama aplikasi.

Implementasi Navigator:

1. Navigator.push: Metode ini digunakan untuk menambahkan halaman baru ke dalam tumpukan halaman dan menavigasi ke halaman tersebut. Contohnya adalah ``Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()))``.

2. Navigator.pushReplacement: Metode ini digunakan untuk mengganti halaman teratas pada tumpukan halaman dengan halaman baru dan menavigasi ke halaman tersebut. Contohnya adalah ``Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewPage()))``.

3. Navigator.pushAndRemoveUntil: Metode ini digunakan untuk menambahkan halaman baru ke dalam tumpukan halaman dan menghapus halaman-halaman sebelumnya dari tumpukan hingga kondisi tertentu terpenuhi. Contohnya adalah ``Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => NewPage()), (route) => false)``.

4. Navigator.pushNamed: Metode ini digunakan untuk menambahkan halaman baru berdasarkan nama rute yang telah didefinisikan ke dalam tumpukan halaman dan menavigasi ke halaman tersebut. Contohnya adalah ``Navigator.pushNamed(context, '/newPage')``.

5. Navigator.pushReplacementNamed: Metode ini digunakan untuk mengganti halaman teratas pada tumpukan halaman dengan halaman baru berdasarkan nama rute yang telah didefinisikan dan menavigasi ke halaman tersebut. Contohnya adalah ``Navigator.pushReplacementNamed(context, '/newPage')``.

6. Navigator.pushNamedAndRemoveUntil: Metode ini digunakan untuk menambahkan halaman baru berdasarkan nama rute yang telah didefinisikan ke dalam tumpukan halaman dan menghapus halaman-halaman sebelumnya dari tumpukan hingga kondisi tertentu terpenuhi. Contohnya adalah ``Navigator.pushNamedAndRemoveUntil(context, '/newPage', (route) => false)``.

7. Navigator.pop: Metode ini digunakan untuk menghapus halaman teratas dari tumpukan halaman dan menavigasi ke halaman sebelumnya. Contohnya adalah ``Navigator.pop(context)``.

8. Navigator.popUntil: Metode ini digunakan untuk menghapus halaman-halaman dari tumpukan hingga kondisi tertentu terpenuhi dan menavigasi ke halaman yang ditentukan. Contohnya adalah ``Navigator.popUntil(context, ModalRoute.withName('/home'))`` atau ``Navigator.popUntil(context, (route) => route.isFirst)`` untuk kembali ke route awal.
