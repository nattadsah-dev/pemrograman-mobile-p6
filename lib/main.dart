import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'cangkang_navigasi.dart';
import 'daftar_destinasi.dart';
import 'destinasi.dart';
import 'detail_destinasi.dart';
import 'halaman_tidak_ditemukan.dart';
import 'tentang.dart';

final _router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const HalamanTidakDitemukan(),
  routes: [
    ShellRoute(
      builder: (context, state, child) =>
          CangkangNavigasi(lokasi: state.uri.path, child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const DaftarDestinasi(),
        ),
        GoRoute(
          path: '/tentang',
          builder: (context, state) => const Tentang(),
        ),
      ],
    ),
    GoRoute(
      path: '/destinasi/:id',
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '');
        final destinasi = id == null ? null : cariDestinasi(id);
        if (destinasi == null) return const HalamanTidakDitemukan();
        return DetailDestinasi(destinasi: destinasi);
      },
    ),
  ],
);

void main() => runApp(const AplikasiWisata());

class AplikasiWisata extends StatelessWidget {
  const AplikasiWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Wisata Sumatera Utara',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}