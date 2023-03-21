# 16_Flutter-Form-and-Advance-Form

## Form

Form Input: Form input dapat dibuat menggunakan widget ``TextFormField`` atau ``TextField``. Widget ini memungkinkan pengguna untuk memasukkan teks melalui keyboard dan memvalidasi nilai input sebelum mengirimkannya.

Form Radio Button: Form radio button dapat dibuat menggunakan widget ``Radio``. Widget ini memungkinkan pengguna untuk memilih satu opsi dari beberapa opsi yang tersedia.

Form Checkbox: Form checkbox dapat dibuat menggunakan widget ``Checkbox``. Widget ini memungkinkan pengguna untuk memilih atau tidak memilih satu atau lebih pilihan yang tersedia.

Form Dropdown: Form dropdown dapat dibuat menggunakan widget ``DropdownButton`` atau ``DropdownButtonFormField``. Widget ini memungkinkan pengguna untuk memilih satu opsi dari beberapa opsi yang tersedia dalam daftar drop-down.

Form Button: Form button dapat dibuat menggunakan widget ``ElevatedButton``, ``TextButton``, ``OutlinedButton``, ``IconButton``, ``InkWell``, atau ``GestureDetector``. Widget ini memungkinkan pengguna untuk memicu suatu tindakan ketika tombol diklik, seperti mengirimkan formulir atau membatalkan tindakan.

## Advance Form (Form Picker)

Date Picker: digunakan untuk memilih tanggal dari sebuah kalender. Impelemntasinya menggunakan ``showDatePicker``.

Time Picker: digunakan untuk memilih waktu dari sebuah jam digital. Impelemntasinya menggunakan ``showTimePicker``.

Color Picker (menggunakan flutter_colorpicker): digunakan untuk memilih warna dari sebuah palet warna. Impelemntasinya menggunakan ``showDialog`` yang mereturn ``AlertDialog`` kemudian menampilkan color picker menggunakan class ``ColorPicker`` dari paket ``flutter_colorpicker``.

File Picker (menggunakan file_picker dan open_file): digunakan untuk memilih file dari penyimpanan internal. Impelemntasinya menggunakan ``FilePicker.platform.pickFiles`` dari paket ``file_picker``, kemudian membuka file nya menggunakan paket ``open_file`` dengan perintah ``OpenFile.open``. Untuk membuka file gambar, dapat menggunakan widget flutter yaitu ``Image.file``.
