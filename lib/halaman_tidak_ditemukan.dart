import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HalamanTidakDitemukan extends StatelessWidget {
  const HalamanTidakDitemukan({super.key});

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;
    final warna = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('404')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.travel_explore, size: 72, color: warna.primary),
              const SizedBox(height: 16),
              Text('Halaman tidak ditemukan', style: teks.titleLarge),
              const SizedBox(height: 8),
              const Text(
                'Destinasi atau alamat yang kamu cari tidak ada.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () => context.go('/'),
                child: const Text('Ke beranda'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}