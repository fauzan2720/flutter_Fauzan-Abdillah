# 25_Introduction-REST-API-JSON

1. Consume API dengan Dio Flutter:

Dio Flutter adalah salah satu package yang digunakan dalam Flutter untuk melakukan request ke API. Package ini memudahkan kita dalam mengirim permintaan HTTP ke server, mengelola respons dan menangani kesalahan. Dalam mengkonsumsi API dengan Dio, kita dapat menggunakan berbagai metode seperti GET, POST, PUT, DELETE, dan lain-lain.

2. Request dan Response API:

Ketika kita melakukan request API dengan Dio, kita dapat mengirimkan parameter seperti query, header, dan body. Sedangkan pada saat server merespons request kita, Dio akan memberikan respons dalam bentuk status code, headers, dan body. Dio juga memiliki fitur untuk mengambil data dari header respons seperti auth token.

3. Output dari Dio:

Output dari Dio dapat berupa respons dalam bentuk JSON, XML, dan plain text. Dio juga menyediakan fitur untuk mengirim file seperti gambar atau video dan menerima file dari server.

4. Data Model:

Pemodelan data dapat mempermudah penanganan kesalahan dalam memanggil variabel dari respons API. Dengan membuat respons API menjadi data model, aplikasi kita akan menjadi lebih mudah dipelihara (maintainable).

5. Either dari Dartz:

Either adalah sebuah konsep yang digunakan dalam Dartz untuk menangani nilai yang bisa berupa sukses atau gagal. Either ini dapat membantu kita dalam menangani kesalahan saat melakukan request API dengan Dio. Kita dapat mengembalikan nilai Either dari Dio dan menentukan tipe nilai sukses dan gagal. Hal ini sangat membantu dalam menangani error handling dalam aplikasi kita.

6. Image Generator dari DiceBear API:

DiceBear API adalah salah satu API yang menyediakan gambar avatar secara acak. Dalam menggunakannya, kita dapat menggunakan Dio untuk melakukan request ke API tersebut dan mengambil gambar secara acak. Response ini nantinya berupa kode svg, sehingga kita perlu package flutter_svg, dan menampilkan ke ui dengan perintah SvgPicture.string.