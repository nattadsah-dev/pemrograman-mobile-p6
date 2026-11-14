import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'destinasi.dart';

class DaftarDestinasi extends StatelessWidget {
  const DaftarDestinasi({super.key});

  int _jumlahKolom(double lebar) {
    if (lebar < 600) return 2;
    if (lebar < 900) return 3;
    return 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wisata Sumatera Utara')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final kolom = _jumlahKolom(constraints.maxWidth);
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: kolom,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              mainAxisExtent: 220,
            ),
            itemCount: daftarDestinasi.length,
            itemBuilder: (context, i) =>
                KartuDestinasi(destinasi: daftarDestinasi[i]),
          );
        },
      ),
    );
  }
}

class KartuDestinasi extends StatelessWidget {
  const KartuDestinasi({super.key, required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/destinasi/${destinasi.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [warna.primaryContainer, warna.tertiaryContainer],
                  ),
                ),
                child: Icon(
                  destinasi.ikon,
                  size: 48,
                  color: warna.onPrimaryContainer,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    destinasi.nama,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: teks.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${destinasi.kategori} · ${destinasi.lokasi}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: teks.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}