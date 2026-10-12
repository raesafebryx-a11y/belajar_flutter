
import 'package:flutter/material.dart';

class ListViewBasic extends StatelessWidget {
  const ListViewBasic({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menu = [
      {
        'judul': 'Home',
        'deskripsi': 'Halaman utama',
        'ikon': Icons.home_rounded,
        'warna': Colors.blue,
      },
      {
        'judul': 'Profile',
        'deskripsi': 'Profil pengguna',
        'ikon': Icons.person_rounded,
        'warna': Colors.green,
      },
      {
        'judul': 'Settings',
        'deskripsi': 'Pengaturan aplikasi',
        'ikon': Icons.settings_rounded,
        'warna': Colors.orange,
      },
      {
        'judul': 'About',
        'deskripsi': 'Informasi aplikasi',
        'ikon': Icons.info_rounded,
        'warna': Colors.purple,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text(
          'Menu Aplikasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Selamat Datang!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Pilih menu yang ingin kamu buka.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 24),

          ...menu.map((item) {
            final Color warna = item['warna'] as Color;

            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: warna.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    item['ikon'] as IconData,
                    color: warna,
                    size: 26,
                  ),
                ),
                title: Text(
                  item['judul'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF1E293B),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    item['deskripsi'] as String,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.blueGrey,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Kamu memilih ${item['judul']}',
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}