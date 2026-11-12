import 'package:belajar_flutter/form/TiketStadion.dart';
import 'package:belajar_flutter/pages/album_page.dart';
import 'package:belajar_flutter/pages/about_page.dart';
import 'package:belajar_flutter/pages/home_page.dart';
import 'package:belajar_flutter/pages/input_page.dart';
import 'package:belajar_flutter/row_column_widget/ProfileTw.dart';
import 'package:belajar_flutter/row_column_widget/RowColumnWidget.dart';
import 'package:belajar_flutter/row_column_widget/RowWidget.dart';
import 'package:belajar_flutter/sized_expanded_stack/instagramlayout.dart'
    as grid_file;

import 'package:flutter/material.dart';

class AppRoutes {
  // Path rute aplikasi
  static const home = '/';
  static const about = '/about';
  static const latihanGrid = '/latihan-grid';
  static const formulir = '/formulir';
  static const inputForm = '/input-form';
  static const outputForm = '/output-form';
  static const tiketStadion = '/tiket-stadion';
  static const album = '/album';
  static const albumPage = '/album-page';
  static const latihanRow = '/latihan-row';
  static const latihanRowColumn = '/latihan-row-column';
  static const profile = '/profile';

  // Daftar rute beserta widget tujuannya
  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    about: (context) => AboutPage(),
    latihanGrid: (context) => grid_file.InstagramLayout(),
    formulir: (context) => BelajarForm(),
    inputForm: (context) => BelajarForm(),
    tiketStadion: (context) => const DiscoverPage(),
    album: (context) => const AlbumPage(),
    latihanRow: (context) => Scaffold(
      appBar: AppBar(title: const Text('Latihan Row')),
      body: const Center(child: RowWidget()),
    ),
    latihanRowColumn: (context) => Scaffold(
      appBar: AppBar(title: const Text('Latihan Row dan Column')),
      body: const RowcolumnWidget(),
    ),
    profile: (context) => const ProfilePage(),
  };
}
