import 'package:flutter/material.dart';

class Containersatu extends StatelessWidget {
  const Containersatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        image: const DecorationImage(
          image: AssetImage("assets/images/gambar.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Text(
        "Auto sint sit amet consectetur adipisicing elit. Quisquam, quod.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}