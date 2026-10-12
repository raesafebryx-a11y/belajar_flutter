
import 'package:flutter/material.dart';

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> siswa = [
      {'nama': 'Andi', 'warna': Colors.blue},
      {'nama': 'Budi', 'warna': Colors.green},
      {'nama': 'Citra', 'warna': Colors.orange},
      {'nama': 'Dina', 'warna': Colors.purple},
      {'nama': 'Eko', 'warna': Colors.pink},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text(
          'Daftar Siswa',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: siswa.length,
        itemBuilder: (context, index) {
          final data = siswa[index];
          final Color warna = data['warna'] as Color;
          final String nama = data['nama'] as String;

          return Container(
            padding: const EdgeInsets.all(12),
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
                horizontal: 6,
                vertical: 4,
              ),
              leading: CircleAvatar(
                radius: 26,
                backgroundColor: warna.withValues(alpha: 0.15),
                child: Text(
                  nama[0],
                  style: TextStyle(
                    color: warna,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              title: Text(
                nama,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF1E293B),
                ),
              ),
              subtitle: const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'Siswa Flutter',
                  style: TextStyle(
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
                    content: Text('Kamu memilih $nama'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 12);
        },
      ),
    );
  }
}