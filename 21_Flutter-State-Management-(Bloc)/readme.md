# 21_Flutter-State-Management-(Bloc)

1. Bloc (Business Logic Component) adalah salah satu konsep state management pada Flutter yang memisahkan logika bisnis dari tampilan (widget). Bloc terdiri dari event dan state.

2. Cubit (Combination of Business Logic and Input Transformation) adalah konsep state management pada Flutter yang digunakan untuk mengelola state pada aplikasi. Cubit lebih sederhana dibandingkan dengan Bloc, karena cubit tidak menggunakan event, hanya fokus pada perubahan state saja.

3. Event adalah suatu tindakan atau peristiwa yang terjadi pada aplikasi dan dapat memicu perubahan pada state. Event digunakan untuk mengirimkan informasi dari tampilan (widget) ke Bloc.

4. State adalah data yang dihasilkan dari Bloc atau Cubit dan digunakan untuk mengatur tampilan (widget) pada aplikasi. State dapat berubah tergantung pada event atau input yang diterima oleh Bloc atau Cubit.

5. BlocProvider adalah widget yang digunakan untuk menyediakan Bloc ke seluruh aplikasi Flutter. BlocProvider dapat digunakan untuk memudahkan pengembang dalam mengelola Bloc pada aplikasi.

6. BlocBuilder adalah widget yang digunakan untuk membangun tampilan (widget) pada aplikasi berdasarkan state yang dihasilkan oleh Bloc atau Cubit. BlocBuilder akan otomatis memperbarui tampilan (widget) ketika terjadi perubahan pada state.

7. BlocListener adalah widget yang digunakan untuk mendengarkan perubahan pada Bloc atau Cubit dan melakukan tindakan tertentu ketika terjadi perubahan. BlocListener biasanya digunakan untuk menampilkan notifikasi atau pesan kesalahan pada aplikasi.

8. BlocConsumer adalah gabungan dari BlocBuilder dan BlocListener yang digunakan untuk membangun tampilan (widget) dan mendengarkan perubahan pada Bloc atau Cubit. BlocConsumer dapat memperbarui tampilan (widget) dan menampilkan notifikasi atau pesan kesalahan ketika terjadi perubahan pada state.

9. context.watch<T>(): membuat widget mendengarkan perubahan pada T, akan merender ulang seluruh widget yang terdapat pada Widget build().

10. context.read<T>(): mengembalikan T tanpa mendengarkannya, akan mendengarkan suatu widget yang bungkus dengan widget Consumer.