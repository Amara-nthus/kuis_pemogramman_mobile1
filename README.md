Kuis Pemrograman Mobile 1: Aplikasi Informasi Rumah Sakit

Dokumentasi proyek aplikasi mobile berbasis Flutter yang menyajikan informasi lokasi, daftar, dan detail rumah sakit.

1. Struktur Direktori Proyek

Berikut adalah struktur hirarki direktori dan berkas pada proyek Kuis_Pemogramman_Mobile1:

kuis_pemogramman_mobile1/
├── .dart_tool/
├── .idea/
├── android/
├── assets/
│   └── image/
│       ├── map_background.png
│       ├── rumah_sakit.png
│       ├── rumah_sakit1.jpg
│       ├── rumah_sakit2.jpg
│       ├── rumah_sakit3.jpg
│       └── rumah_sakit4.jpg
├── build/
├── ios/
├── lib/
│   ├── widgets/
│   │   ├── CategoryCard.dart
│   │   ├── home_page.dart
│   │   ├── hospital_detail_page.dart
│   │   ├── hospital_list_page.dart
│   │   └── map_page.dart
│   └── main.dart
├── linux/
├── macos/
├── test/
├── web/
├── windows/
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── kuis_pemogramman_mobile1.iml
├── pubspec.lock
├── pubspec.yaml
└── README.md


2. Deskripsi Berkas & Komponen Utama

Direktori lib/

main.dart: Entry point aplikasi. Berfungsi menginisialisasi pustaka, konfigurasi tema, dan menetapkan rute utama aplikasi.

widgets/home_page.dart: Halaman utama yang menampilkan ringkasan informasi, fitur pencarian, dan navigasi utama.

widgets/hospital_list_page.dart: Halaman daftar rumah sakit yang menampilkan daftar fasilitas kesehatan.

widgets/hospital_detail_page.dart: Halaman rincian informasi rumah sakit, menyajikan detail spesifik, fasilitas, dan kontak.

widgets/map_page.dart: Halaman peta interaktif untuk menampilkan lokasi fisik rumah sakit.

widgets/CategoryCard.dart: Komponen UI reusable untuk kartu kategori layanan atau jenis rumah sakit.

Berkas Konfigurasi Root

pubspec.yaml: Berkas manifes proyek untuk mengelola dependensi SDK, pustaka pihak ketiga, serta pendaftaran aset gambar.

pubspec.lock: Berkas pengunci versi spesifik dari setiap dependensi terinstal.

analysis_options.yaml: Konfigurasi linter Dart untuk memastikan standar penulisan kode (code style) tetap konsisten.

kuis_pemogramman_mobile1.iml: Berkas konfigurasi modul untuk sistem IDE IntelliJ/Android Studio.

.gitignore: Daftar berkas dan direktori yang dikecualikan dari pelacakan Version Control System (Git).

.metadata: Berkas internal Flutter untuk melacak properti dan konfigurasi versi proyek.

3. Konfigurasi Aset

Seluruh aset gambar didaftarkan dalam berkas pubspec.yaml sebagai berikut:

flutter:
uses-material-design: true

assets:
- assets/image/map_background.png
- assets/image/rumah_sakit.png
- assets/image/rumah_sakit1.jpg
- assets/image/rumah_sakit2.jpg
- assets/image/rumah_sakit3.jpg
- assets/image/rumah_sakit4.jpg


4. Panduan Pengoperasian

Prasyarat

Flutter SDK: Versi 3.x atau lebih baru

Dart SDK: Versi 3.x atau lebih baru

IDE: Visual Studio Code / Android Studio

Langkah-Langkah

Clone repositori ke lingkungan lokal.

Jalankan perintah untuk mengunduh seluruh dependensi:

flutter pub get


Jalankan aplikasi pada emulator atau perangkat fisik:

flutter run
