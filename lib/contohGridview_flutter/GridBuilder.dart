
import 'package:flutter/material.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> buah = [
      {
        'nama': 'Apel',
        'ikon': Icons.apple,
        'warna': const Color(0xFFFF5B61),
      },
      {
        'nama': 'Jeruk',
        'ikon': Icons.circle,
        'warna': const Color(0xFFFFA726),
      },
      {
        'nama': 'Mangga',
        'ikon': Icons.spa,
        'warna': const Color(0xFF43B96B),
      },
      {
        'nama': 'Pisang',
        'ikon': Icons.energy_savings_leaf,
        'warna': const Color(0xFFFFCA28),
      },
      {
        'nama': 'Anggur',
        'ikon': Icons.grain,
        'warna': const Color(0xFF9560E8),
      },
      {
        'nama': 'Semangka',
        'ikon': Icons.water_drop,
        'warna': const Color(0xFFFF5D88),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      appBar: AppBar(
        title: const Text(
          'Grid Builder',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2878F0),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: buah.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final item = buah[index];
          final Color warna = item['warna'] as Color;

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  warna,
                  warna.withValues(alpha: 0.75),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: warna.withValues(alpha: 0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Kamu memilih ${item['nama']}',
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.25),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          item['ikon'] as IconData,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        item['nama'] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Buah segar',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}