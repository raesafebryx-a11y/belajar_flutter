
import 'package:flutter/material.dart';

class GridBasic extends StatelessWidget {
  const GridBasic({super.key});
  
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final double widthScreen = mediaQuery.size.width;
    final double heightScreen = mediaQuery.size.height;
    final List<Map<String, dynamic>> kotak = [
      {
        'judul': 'Kotak 1',
        'ikon': Icons.home_rounded,
        'warna': Colors.redAccent,
      },
      {
        'judul': 'Kotak 2',
        'ikon': Icons.favorite_rounded,
        'warna': Colors.green,
      },
      {
        'judul': 'Kotak 3',
        'ikon': Icons.star_rounded,
        'warna': Colors.blue,
      },
      {
        'judul': 'Kotak 4',
        'ikon': Icons.settings_rounded,
        'warna': Colors.orange,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text(
          'Grid Basic',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: widthScreen / heightScreen,
        children: kotak.map((item) {
          final warna = item['warna'] as Color;

          return Container(
            decoration: BoxDecoration(
              color: warna,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: warna.withValues(alpha: 0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item['ikon'] as IconData,
                    color: Colors.white,
                    size: 42,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  item['judul'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}