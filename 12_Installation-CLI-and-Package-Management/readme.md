# 12_Installation-CLI-and-Package-Management

``flutter create --org com.<package_name> <project_name>``: membuat proyek Flutter sekaligus mengatur nama package pada proyek

``flutter packages get`` atau ``flutter pub get``: install paket/package yang telah ditambahkan pada file pubspec.yaml

``flutter pub add <nama_paket>``: menambahkan dan install paket/package pada proyek Flutter

``flutter pub remove <nama_paket>``: hapus paket/package pada proyek Flutter

``flutter run``: menjalankan proyek Flutter

``flutter build ios``: membuat file .ipa

``flutter build apk``: membuat file .apk

``flutter build apk --debug``: membuat file .apk untuk debug

``flutter build apk --release``: membuat file .apk yang siap dirilis

``flutter build appbundle``: membuat file .aab (opsi lain untuk proyek yang siap dirilis di gplay store)

``flutter clean``: membersihkan cache pada proyek Flutter