import 'package:flutter/material.dart';
// import 'package:belajar_flutter/container_widget/LatihanSoal.dart';
// import 'package:belajar_flutter/container_widget/LatihanSoal2.dart';
// import 'package:belajar_flutter/container_widget/KartuProfil.dart';
// import 'package:belajar_flutter/container_widget/ContainerWidget.dart';
// import 'package:belajar_flutter/row_column_widget/RowWidget.dart';
// import 'package:belajar_flutter/row_column_widget/RowColumnWidget';
// import 'package:belajar_flutter/sized_expanded_stack/ExpandedWidget.dart';
// import 'package:belajar_flutter/sized_expanded_stack/SizedBoxWidget.dart';
// import 'package:belajar_flutter/sized_expanded_stack/StackWidget.dart';
// import 'package:belajar_flutter/row_column_widget/ProfileTw.dart';
// import 'package:belajar_flutter/sized_expanded_stack/LayoutSatu.dart';
// import 'package:belajar_flutter/sized_expanded_stack/LayoutDua.dart';
// import 'package:belajar_flutter/sized_expanded_stack/LayoutTiga.dart';
// import 'package:belajar_flutter/sized_expanded_stack/LatihanLayout.dart';
// import 'package:belajar_flutter/contohlistview_flutter/ListViewBasic.dart';
// import 'package:belajar_flutter/contohlistview_flutter/ListView.builder.dart';
// import 'package:belajar_flutter/contohlistview_flutter/ListView.separated.dart';
// import 'package:belajar_flutter/contohlistview_flutter/CustomListView.dart';
// import 'package:belajar_flutter/contohGridview_flutter/GridBasic.dart';
// import 'package:belajar_flutter/contohGridview_flutter/GridBuilder.dart';
// import 'package:belajar_flutter/contohGridview_flutter/GridProductPage.dart';
import 'package:belajar_flutter/sized_expanded_stack/instagramlayout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPL 2',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 255, 255),
        // appBar: AppBar(
        //   title: const Text('RPL 2'),
        //   backgroundColor: Colors.blue,
        //   centerTitle: true,
        // ),
        body: InstagramLayout(), // Replace with your desired widget
      ),
    );
  }
}

// class HelloWidget extends StatelessWidget {
//   const HelloWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Hello, Flutter Nich!',
//         style: TextStyle(
//           color: Colors.blue,
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
