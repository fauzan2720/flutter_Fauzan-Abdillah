# 10_Deep-Dive-Into-Dart-OOP

1.	Constructor: method khusus dalam sebuah class yang dipanggil saat objek dibuat dengan ciri-ciri memiliki nama sama dengan class dan tidak memiliki tipe kembalian/return.
2.	Inheritance (extends): sebuah class dapat mewarisi sifat atau method dari class lain.
3.	Method Overriding: subclass dapat mengganti implementasi sebuah method di superclass dengan implementasi yang berbeda.
4.	Interface (implements): sebuah class dapat mengimplementasikan satu atau lebih interface, sehingga class tersebut harus menyediakan implementasi untuk semua method yang didefinisikan dalam interface (semua pada method superclaa wajib di override).
5.	Abstract class: class yang tidak bisa di-instantiate (tidak bisa dibuat objeknya langsung), namun dapat digunakan sebagai class induk untuk subclass yang mewarisi perilaku dan sifat dari abstract class (method tidak harus di override).
6.	Polymorphism: kemampuan untuk mengambil banyak bentuk yang berbeda pada class yang sama dengan parameter yang berbeda.
7.	Generics *<T>*: kita dapat menentukan tipe data pada waktu kompilasi, sehingga membuat kode lebih reusable dan generic.
8.	Mixin: digunakan untuk memberikan fitur tambahan pada class lain, tetapi tidak dapat di-instantiate dan hanya digunakan sebagai superclass dalam class-child.
