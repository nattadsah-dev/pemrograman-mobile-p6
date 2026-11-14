import 'package:flutter/material.dart';

class Tentang extends StatelessWidget {
  const Tentang({super.key});

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Wisata Sumatera Utara', style: teks.headlineSmall),
                const SizedBox(height: 12),
                const Text(
                  'Aplikasi katalog destinasi wisata di Sumatera Utara. '
                  'Dibuat untuk Tugas Rutin 6 Pemrograman Mobile '
                  'dengan materi layout responsif dan navigasi.',
                ),
                const SizedBox(height: 16),
                const Text('Nama: Natasha Patricia Nainggolan'),
                const Text('NIM: 4243550006'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}