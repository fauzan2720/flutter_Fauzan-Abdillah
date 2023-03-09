# 11_Introduction-Flutter-Widget

``StatelessWidget``: Widget yang bersifat statis dan tidak memiliki state. StatelessWidget tidak dapat diubah setelah dibuat, sehingga tidak memiliki fungsi setState().

``StatefulWidget``: Widget yang memiliki state, sehingga bisa diubah dan diperbarui. StatefulWidget menggunakan fungsi setState() untuk memperbarui tampilan aplikasi.

``setState()``: Fungsi yang digunakan untuk memperbarui state dari sebuah widget. Ketika setState() dipanggil, Flutter akan **memperbarui/membangun ulang tampilan UI dari Widget build()**.

``MaterialApp``: Widget yang menyediakan tampilan dasar untuk aplikasi Flutter dengan menggunakan material design. MaterialApp menyediakan berbagai macam widget, seperti Appbar, Scaffold, dan Text.

``CupertinoApp``: Widget yang menyediakan tampilan dasar untuk aplikasi Flutter dengan menggunakan gaya desain Apple.

``Scaffold``: Widget yang menyediakan tampilan dasar untuk sebuah halaman atau layar dalam aplikasi. Scaffold dapat berisi beberapa widget, seperti Appbar, Drawer, dan lain-lain.
