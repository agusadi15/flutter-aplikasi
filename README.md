# Aplikasi Pemesanan makanan MAKBYAR

Aplikasi ini adalah aplikasi restoran berbasis Flutter yang memungkinkan pengguna untuk menjelajahi menu makanan, melihat rekomendasi makanan, dan mengakses profil pengguna. Berikut adalah fitur-fitur utama yang ditawarkan oleh aplikasi ini:

## Fitur Utama

### Halaman Utama (HomePage)
- Menampilkan ucapan selamat datang kepada pengguna.
- Menyediakan kotak pencarian untuk mencari menu makanan.
- Menampilkan kategori makanan dengan ikon yang menarik.
- Menampilkan rekomendasi makanan berdasarkan data yang diambil dari Firestore.

### Navigasi Antar Halaman
- Menggunakan `BottomNavigationBar` untuk berpindah antara halaman utama, halaman riwayat, dan halaman profil.
- Pengguna dapat mengklik rekomendasi makanan untuk melihat detail lebih lanjut tentang makanan tersebut di halaman `DetailPage`.

### Halaman Rekomendasi Makanan
- Mengambil data rekomendasi makanan dari Firestore dan menampilkannya dalam bentuk kartu yang menarik.
- Setiap kartu rekomendasi makanan menampilkan gambar, nama makanan, dan rating.
- Pengguna dapat mengklik kartu makanan untuk melihat detail makanan tersebut.

### Halaman Profil
- Menyediakan informasi profil pengguna.

### Halaman Detail Makanan (DetailPage)
- Menampilkan gambar makanan, nama makanan, harga, rating, dan deskripsi singkat tentang makanan tersebut.
- Menyediakan tombol "Beli Sekarang" untuk memudahkan pengguna dalam memesan makanan.

## Teknologi yang Digunakan
- **Flutter**: Framework utama untuk pengembangan aplikasi.
- **Google Fonts**: Untuk meningkatkan estetika teks.
- **Firestore**: Untuk pengelolaan data rekomendasi makanan secara real-time.


