# 27_Finite-State-Machine-and-Unit-Testing

1. Finite State Machine (FSM) adalah suatu teknik dalam mengelola keadaan aplikasi (state) dengan menggunakan state management provider. Pada implementasi ini, setiap perubahan state akan dikelola melalui objek FSM yang berisi daftar state (initial, loading, success, failed, dll). Ketika terjadi perubahan state, provider akan memberikan notifikasi ke widget untuk melakukan update UI sesuai dengan state terbaru.

2. Berikut adalah langkah-langkah membuat Finite State Machine pada proyek Flutter:

    - Menentukan state: ``enum DataStateStatus { initial, loading, success, failed, empty, updated }``

    - Definisikan state awal ketika provider di panggil: ``DataStateStatus state = DataStateStatus.initial;``

    - Membuat fungsi untuk mengubah state: ``DataStateStatus changeState(DataStateStatus newState) { ... }``

    - Tentukan state ketika menjalankan suatu progra: ``changeState(DataStateStatus.loading);``

    - Buat statement untuk menentukan ui yang akan ditampilkan: ``if (value.state == DataStateStatus.success) { ... }``

3. Unit Testing adalah suatu teknik pengujian perangkat lunak yang dilakukan pada level kode program. Tujuan dari unit testing adalah untuk memastikan bahwa setiap unit (komponen terkecil) dalam program berfungsi sesuai dengan yang diharapkan.

4. Fungsi test() digunakan untuk membuat pengujian dan fungsi expect() digunakan untuk membandingkan hasil pengujian dengan hasil yang diharapkan. Fungsi expect() menerima dua parameter, yaitu nilai aktual hasil pengujian dan nilai yang diharapkan. Jika nilai aktual dan nilai yang diharapkan sama, pengujian dianggap sukses.

5. Fungsi test group() digunakan untuk mengelompokkan beberapa pengujian ke dalam satu grup. Tujuannya adalah untuk memudahkan pengaturan dan eksekusi pengujian.

6. Mockito adalah library yang digunakan untuk membuat mock object pada pengujian unit. Mock object digunakan untuk mensimulasikan perilaku objek asli dalam kondisi tertentu.

7. Build Runner adalah library yang digunakan untuk membangun kode yang dihasilkan oleh generator kode. Build Runner membantu dalam mengotomatisasi proses membangun kode sehingga mempercepat waktu pengembangan aplikasi.