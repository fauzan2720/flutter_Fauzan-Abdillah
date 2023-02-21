import 'dart:io';

void main() {
  print("cek palindrom / cari faktor bilangan ? (1/2): ");
  int cek = int.parse(stdin.readLineSync()!);

  if (cek == 1) {
    checkPalindrom();
  } else if (cek == 2) {
    searchFactor();
  } else {
    print("Masukkan inputan dengan benar!");
  }
}

void checkPalindrom() {
  print("Masukkan kata: ");
  String word = stdin.readLineSync() ?? ''; // jika null, memberikan value = ''

  // membalik kata
  String reversedWord = word.split('').reversed.join();

  if (word == reversedWord) {
    print('palindrom');
  } else {
    print('bukan palindrom');
  }
}

void searchFactor() {
  print("Masukkan bilangan: ");
  int bilangan = int.parse(stdin.readLineSync()!);

  print("Faktor dari $bilangan adalah: ");
  for (int i = 1; i < bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }
}
