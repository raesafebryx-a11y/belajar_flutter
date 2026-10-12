import 'package:flutter/material.dart';

class LatihanSoal extends StatelessWidget {
  const LatihanSoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Kotak Hijau
        Container(
  width: 300,
  height: 120,
  margin: const EdgeInsets.all(20),
  padding: const EdgeInsets.all(15), 
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: Colors.lightGreenAccent,
    border: Border.all(
      color: Colors.green,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(15),
  ),
  child: const Text(
    'SMK ASSALAAM BANDUNG',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
),
         
         // jarak
        const SizedBox(height: 50),

        // kotak abu
        Container(
          width: 200,
          height: 100,
           margin: const EdgeInsets.all(20),
           padding: const EdgeInsets.all(15), 
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 239, 10),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text(
            'XII RPL 2',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}