import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:belajar_flutter/models/user.dart';
import 'package:belajar_flutter/pages/userDetailPage.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Future<List<UserModel>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = _fetchUsers();
  }

  Future<List<UserModel>> _fetchUsers() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal mengambil data user: ${response.statusCode}');
    }

    return userModelFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar User')),
      body: FutureBuilder<List<UserModel>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Gagal memuat data: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(user.name.isNotEmpty ? user.name[0] : '?'),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailPage(user: user),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}