import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'destinasi.dart';

class DetailDestinasi extends StatelessWidget {
  const DetailDestinasi({super.key, required this.destinasi});

  final Destinasi destinasi;

  void _kembali(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Kembali',
          onPressed: () => _kembali(context),
        ),
        title: Text(destinasi.nama),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final lebar = constraints.maxWidth >= 700;

          if (lebar) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 5, child: _HeroDestinasi(destinasi: destinasi)),
                Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: _InfoDestinasi(destinasi: destinasi),
                  ),
                ),
              ],
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 260,
                  child: _HeroDestinasi(destinasi: destinasi),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: _InfoDestinasi(destinasi: destinasi),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _HeroDestinasi extends StatelessWidget {
  const _HeroDestinasi({required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [warna.primary, warna.tertiary],
            ),
          ),
        ),
        Center(
          child: Icon(destinasi.ikon, size: 96, color: warna.onPrimary),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: Chip(label: Text(destinasi.kategori)),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: warna.scrim.withValues(alpha: 0.5),
            padding: const EdgeInsets.all(12),
            child: Text(
              destinasi.nama,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: teks.titleLarge?.copyWith(color: warna.onPrimary),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoDestinasi extends StatelessWidget {
  const _InfoDestinasi({required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(destinasi.nama, style: teks.headlineSmall),
        const SizedBox(height: 16),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.location_on),
          title: Text(destinasi.lokasi),
          subtitle: const Text('Lokasi'),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.confirmation_number),
          title: Text(destinasi.tiket),
          subtitle: const Text('Tiket masuk (contoh)'),
        ),
        const SizedBox(height: 8),
        Text('Tentang tempat ini', style: teks.titleMedium),
        const SizedBox(height: 8),
        Text(destinasi.deskripsi, style: teks.bodyLarge),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: () =>
              context.canPop() ? context.pop() : context.go('/'),
          icon: const Icon(Icons.arrow_back),
          label: const Text('Kembali ke daftar'),
        ),
      ],
    );
  }
}