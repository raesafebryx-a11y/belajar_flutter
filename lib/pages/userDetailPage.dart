import 'package:flutter/material.dart';
import 'package:belajar_flutter/models/user.dart';

class UserDetailPage extends StatelessWidget {
  final UserModel user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _item('Nama', user.name),
          _item('Username', user.username),
          _item('Email', user.email),
          _item('Telepon', user.phone),
          _item('Website', user.website),
          _item('Kota', user.address.city),
          _item('Perusahaan', user.company.name),
        ],
      ),
    );
  }

  Widget _item(String judul, String isi) {
    return ListTile(title: Text(judul), subtitle: Text(isi));
  }
}