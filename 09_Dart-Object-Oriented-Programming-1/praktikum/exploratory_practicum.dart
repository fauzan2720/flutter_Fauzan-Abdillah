import 'list_book.dart';

class BookModel {
  final int id;
  final String judul;
  final String penerbit;
  final int harga;
  final String kategori;

  BookModel({
    required this.id,
    required this.judul,
    required this.penerbit,
    required this.harga,
    required this.kategori,
  });
}

class Book {
  List<BookModel> dataBuku = [];

  void tambahkan(BookModel book) {
    dataBuku.add(book);
    print("(!) ${book.judul} berhasil ditambahkan");
  }

  void tampilkan() {
    List buku = dataBuku
        .map((element) =>
            "{${element.id}, ${element.judul}, ${element.penerbit}, ${element.harga}, ${element.kategori}}")
        .toList();
    print("Successfully (${buku.length} data): $buku");
  }

  void hapus(BookModel book) {
    dataBuku.remove(book);
    print("(!) ${book.judul} berhasil dihapus");
  }
}

void main() {
  final Book book = Book();

  book.tambahkan(book1);
  book.tambahkan(book2);
  book.tambahkan(book3);
  book.tambahkan(book4);
  book.tambahkan(book5);

  book.tampilkan();

  book.hapus(book4);
  book.hapus(book2);

  book.tampilkan();
}
