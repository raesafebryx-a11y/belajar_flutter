
import 'package:belajar_flutter/pages/about_page.dart';
import 'package:belajar_flutter/pages/home_page.dart';
import 'package:belajar_flutter/pages/input_page.dart';
import 'package:belajar_flutter/sized_expanded_stack/instagramlayout.dart' as grid_file;
import 'package:flutter/material.dart';

class AppRoutes {
  // Path rute aplikasi
  static const home = '/';
  static const about = '/about';
  static const latihanGrid = '/latihan-grid';
  static const formulir = '/formulir';
  static const inputForm = '/input-form';
  static const outputForm = '/output-form';



  // Daftar rute beserta widget tujuannya
  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    about: (context) => AboutPage(),
    latihanGrid: (context) => grid_file.InstagramLayout(),
    formulir:(context) => BelajarForm(),
    inputForm: (context) => BelajarForm(),
    

  };
}
