import 'package:flutter/material.dart';

class KartuProfil extends StatelessWidget {
  const KartuProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 300,
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           Container(width: 100, height: 100, color: Colors.redAccent,),
           Column(
            children: [
              Text("Nama: Raesa"),
              Text("Kelas: XII RPL 2"),
              Text("Nis: 123456789"),
            ],
           )
          ],
        ),
      ),
    );
  }
}