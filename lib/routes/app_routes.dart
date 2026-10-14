
import 'package:belajar_flutter/pages/formulir_page.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/pages/home_page.dart';
import 'package:belajar_flutter/pages/about_page.dart';
import 'package:belajar_flutter/sized_expanded_stack/instagramlayout.dart';

class AppRoutes {
  static const home = '/';
  static const about = '/about';
  static const instagram = '/instagram';
  static const formulir = '/formulir';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    about: (context) => const AboutPage(),
    instagram: (context) => const InstagramLayout(),
    formulir: (context) => const FormulirPage(),
  };
}
