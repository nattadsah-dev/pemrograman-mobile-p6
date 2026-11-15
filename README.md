# Wisata Sumatera Utara (Tugas Rutin 6)

Nama: ____  | NIM: ____  | Mata kuliah: Pemrograman Mobile, Pertemuan 6

Aplikasi Flutter katalog 8 destinasi wisata Sumatera Utara dengan layout
responsif (360–1280 dp) dan navigasi adaptif memakai go_router.

## Rute

| Rute | Halaman |
|---|---|
| `/` | DaftarDestinasi |
| `/destinasi/:id` | DetailDestinasi (id tidak valid → halaman 404) |
| `/tentang` | Tentang |
| rute lain | Halaman 404 (`errorBuilder`) |

## Keputusan Responsif

| Keputusan | Aturan | Alasan |
|---|---|---|
| Jumlah kolom grid | < 600 dp → 2, < 900 dp → 3, lainnya → 4 | Memakai `LayoutBuilder` agar yang diukur adalah lebar area grid yang sebenarnya, bukan lebar layar. Saat rail tampil, area grid sudah berkurang sehingga kolom tidak kesempitan. |
| Tinggi kartu | `mainAxisExtent: 220` (tetap) | Rasio tetap berisiko overflow saat jumlah kolom berubah. Tinggi tetap menjaga isi kartu aman di semua lebar. |
| Navigasi | < 840 dp → NavigationBar, ≥ 840 dp → NavigationRail | Memakai `MediaQuery` karena yang diputuskan adalah lebar layar penuh. Bar bawah mudah dijangkau ibu jari di layar kecil, sedangkan layar lebar punya ruang horizontal untuk rail di sisi kiri. |
| Layout detail | < 700 dp → satu kolom, ≥ 700 dp → dua kolom (gambar kiri, info kanan) | Di layar sempit, dua kolom membuat teks terlalu sempit. Di layar lebar, satu kolom membuat gambar terlalu lebar dan info terlalu jauh di bawah. |
| Stack | Gambar hero berisi gradien, ikon, chip kategori, dan judul | Chip dan judul perlu ditumpuk di atas gambar, yang tepat dikerjakan dengan `Stack` dan `Positioned`. |
| Bebas overflow | Teks pakai `maxLines` + `ellipsis`, konten panjang dibungkus `SingleChildScrollView`, halaman Tentang dibatasi `ConstrainedBox` | Mencegah garis overflow di rentang 360–1280 dp. |

## Tangkapan Layar

1. 360 dp: NavigationBar, grid 2 kolom
2. 720 dp: NavigationBar, grid 3 kolom
3. 1280 dp: NavigationRail, grid 4 kolom
4. Halaman detail (sempit atau lebar)

(Tempel gambar di sini.)

## Cara Menjalankan

```bash
flutter pub get
flutter run -d chrome
```
