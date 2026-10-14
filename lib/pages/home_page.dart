
import 'package:flutter/material.dart';
import 'package:belajar_flutter/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          const Center(
            child: Text('Halaman Home'),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.about);
            },
            child: const Text('Pergi ke About'),
          ),

          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.instagram);
            },
            child: const Text('Pergi ke Instagram'),
          ),
          
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.formulir);
            },
            child: const Text('Pergi ke Formulir'),
          ),
        ],
      ),
    );
  }
}
