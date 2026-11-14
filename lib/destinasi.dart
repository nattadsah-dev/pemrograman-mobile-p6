import 'package:flutter/material.dart';

class Destinasi {
  const Destinasi({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.kategori,
    required this.deskripsi,
    required this.hargaTiket,
    required this.ikon,
  });

  final int id;
  final String nama;
  final String lokasi;
  final String kategori;
  final String deskripsi;
  final int hargaTiket;
  final IconData ikon;

  String get tiket {
    if (hargaTiket == 0) return 'Gratis';
    final s = hargaTiket.toString();
    final buf = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return 'Rp $buf';
  }
}

const daftarDestinasi = <Destinasi>[
  Destinasi(
    id: 1,
    nama: 'Danau Toba',
    lokasi: 'Toba & Samosir',
    kategori: 'Alam',
    deskripsi:
        'Danau vulkanik terbesar di dunia dengan Pulau Samosir di tengahnya. '
        'Cocok untuk menikmati pemandangan, budaya Batak, dan berkeliling pulau.',
    hargaTiket: 0,
    ikon: Icons.water,
  ),
  Destinasi(
    id: 2,
    nama: 'Istana Maimun',
    lokasi: 'Medan',
    kategori: 'Sejarah',
    deskripsi:
        'Istana peninggalan Kesultanan Deli dengan perpaduan arsitektur '
        'Melayu, Mughal, dan Eropa. Pengunjung bisa melihat ruang singgasana '
        'dan koleksi foto keluarga kesultanan.',
    hargaTiket: 5000,
    ikon: Icons.account_balance,
  ),
  Destinasi(
    id: 3,
    nama: 'Bukit Lawang',
    lokasi: 'Langkat',
    kategori: 'Alam',
    deskripsi:
        'Pintu masuk Taman Nasional Gunung Leuser yang terkenal sebagai '
        'tempat melihat orangutan Sumatera di habitat aslinya.',
    hargaTiket: 20000,
    ikon: Icons.park,
  ),
  Destinasi(
    id: 4,
    nama: 'Air Terjun Sipiso-piso',
    lokasi: 'Karo',
    kategori: 'Alam',
    deskripsi:
        'Air terjun tinggi di sisi utara Danau Toba. Dari titik pandang di '
        'atasnya, pengunjung bisa melihat lembah dan hamparan danau.',
    hargaTiket: 10000,
    ikon: Icons.waterfall_chart,
  ),
  Destinasi(
    id: 5,
    nama: 'Berastagi',
    lokasi: 'Karo',
    kategori: 'Pegunungan',
    deskripsi:
        'Dataran tinggi berhawa sejuk di kaki Gunung Sibayak dan Sinabung, '
        'terkenal dengan pasar buah, sayur, dan jeruk khas Karo.',
    hargaTiket: 0,
    ikon: Icons.terrain,
  ),
  Destinasi(
    id: 6,
    nama: 'Masjid Raya Al-Mashun',
    lokasi: 'Medan',
    kategori: 'Religi',
    deskripsi:
        'Masjid bersejarah peninggalan Kesultanan Deli dengan kubah besar dan '
        'ornamen khas, menjadi ikon kota Medan.',
    hargaTiket: 0,
    ikon: Icons.mosque,
  ),
  Destinasi(
    id: 7,
    nama: 'Pantai Lagundri',
    lokasi: 'Nias Selatan',
    kategori: 'Pantai',
    deskripsi:
        'Pantai berbentuk teluk di Pulau Nias yang terkenal sebagai '
        'tujuan peselancar dari berbagai negara.',
    hargaTiket: 0,
    ikon: Icons.beach_access,
  ),
  Destinasi(
    id: 8,
    nama: 'Tangkahan',
    lokasi: 'Langkat',
    kategori: 'Alam',
    deskripsi:
        'Wisata alam di pertemuan dua sungai, dengan hutan tropis, '
        'pemandian air panas, dan kegiatan bersama gajah.',
    hargaTiket: 15000,
    ikon: Icons.forest,
  ),
];

Destinasi? cariDestinasi(int id) {
  for (final d in daftarDestinasi) {
    if (d.id == id) return d;
  }
  return null;
}