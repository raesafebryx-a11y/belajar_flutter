
import 'package:flutter/material.dart';

class KartuDashboard extends StatelessWidget {
  const KartuDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 80,
              color: Colors.blue[100],
              alignment: Alignment.center,
              child: const Text("Pemasukan"),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 80,
              color: Colors.green[100],
              alignment: Alignment.center,
              child: const Text("Pengeluaran"),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 80,
              color: Colors.orange[100],
              alignment: Alignment.center,
              child: const Text("Saldo"),
            ),
          ),
        ],
      ),
    );
  }
}