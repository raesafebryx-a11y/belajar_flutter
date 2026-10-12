import 'package:flutter/material.dart';

class Latihansoal2 extends StatelessWidget {
  const Latihansoal2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(10),
          width: 250,
          color: Colors.grey,
          child: const Center(
            child: Text(
              "Real Madrid",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
              padding: const EdgeInsets.all(20),
              color: Colors.grey.shade300,
              child: Image.asset(
                "assets/images/bantai1.jpg",
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),

            Container(
              margin: const EdgeInsets.only(
                top: 25,
                left: 20,
              ),
              padding: const EdgeInsets.all(20),
              color: Colors.grey.shade300,
              child: Image.asset(
                "assets/images/bantai2.jpg",
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),

        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(15),
          color: Colors.grey.shade300,
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(20),
            color: Colors.lightBlue,
            child: const Text(
              "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.",
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(15),
          color: Colors.grey.shade300,
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(20),
            color: Colors.lightBlue,
            child: const Text(
              "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}