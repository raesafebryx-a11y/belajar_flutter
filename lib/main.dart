import 'package:belajar_flutter/pages/home_page.dart';
import 'package:belajar_flutter/routes/app_routes.dart';
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
// import 'package:belajar_flutter/sized_expanded_stack/instagramlayout.dart';

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
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}