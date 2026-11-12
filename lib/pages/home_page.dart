import 'package:flutter/material.dart';
import 'package:belajar_flutter/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Tiket Stadion',
        'subtitle': 'Online Shop & Kasir',
        'icon': Icons.stadium_rounded,
        'color': const Color(0xFF1DB954),
        'bgColor': const Color(0xFFE8F8EE),
        'route': AppRoutes.tiketStadion,
      },
      {
        'title': 'Formulir',
        'subtitle': 'Input & Output Data',
        'icon': Icons.edit_document,
        'color': const Color(0xFF2563EB),
        'bgColor': const Color(0xFFEFF6FF),
        'route': AppRoutes.formulir,
      },
      {
        'title': 'Album API',
        'subtitle': 'Ambil data dari API',
        'icon': Icons.album_rounded,
        'color': const Color(0xFF7C3AED),
        'bgColor': const Color(0xFFF5F3FF),
        'route': AppRoutes.album,
      },
      {
        'title': 'Instagram UI',
        'subtitle': 'Latihan Grid Layout',
        'icon': Icons.grid_view_rounded,
        'color': const Color(0xFFE11D48),
        'bgColor': const Color(0xFFFFF1F2),
        'route': AppRoutes.latihanGrid,
      },
      {
        'title': 'Latihan Row',
        'subtitle': 'Belajar widget Row',
        'icon': Icons.view_column_rounded,
        'color': const Color(0xFF0891B2),
        'bgColor': const Color(0xFFECFEFF),
        'route': AppRoutes.latihanRow,
      },
      {
        'title': 'Row dan Column',
        'subtitle': 'Susunan widget dasar',
        'icon': Icons.dashboard_customize_rounded,
        'color': const Color(0xFF059669),
        'bgColor': const Color(0xFFECFDF5),
        'route': AppRoutes.latihanRowColumn,
      },
      {
        'title': 'Profile',
        'subtitle': 'Contoh halaman profil',
        'icon': Icons.person_rounded,
        'color': const Color(0xFF9333EA),
        'bgColor': const Color(0xFFFAF5FF),
        'route': AppRoutes.profile,
      },
      {
        'title': 'About App',
        'subtitle': 'Informasi Aplikasi',
        'icon': Icons.info_outline_rounded,
        'color': const Color(0xFFD97706),
        'bgColor': const Color(0xFFFFFBEB),
        'route': AppRoutes.about,
      },
      {
        'title': 'Post API',
        'subtitle': 'Ambil data dari API',
        'icon': Icons.post_add_rounded,
        'color': const Color(0xFFDC2626),
        'bgColor': const Color(0xFFFEE2E2),
        'route': AppRoutes.postPage,
      },
      {
        'title': 'User API',
        'subtitle': 'Ambil data dari API',
        'icon': Icons.person_search_rounded,
        'color': const Color(0xFF2563EB),
        'bgColor': const Color(0xFFEFF6FF),
        'route': AppRoutes.userPage,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Belajar Flutter',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang 👋',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),

            const SizedBox(height: 20),

            // Banner Tiket Stadion
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.tiketStadion);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 10, 10, 10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tugas Seharian',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Menu Navigasi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            // Grid Menu
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: menuItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                final item = menuItems[index];

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () =>
                        Navigator.pushNamed(context, item['route'] as String),
                    child: Ink(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item['icon'], color: item['color'], size: 30),
                          const SizedBox(height: 15),
                          Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item['subtitle'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
