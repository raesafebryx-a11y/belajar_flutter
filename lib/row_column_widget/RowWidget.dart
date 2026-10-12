import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('ini isi row 1'),
        Text('ini isi row 2'),
        Text('ini isi row 3'),
        FlutterLogo(
          size: 50,
          textColor: Colors.blue,
        ),
      ],
    );
  }
}