import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: const Text("Profil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.person, size: 100, color: Colors.grey),
            SizedBox(height: 16),
            Text("Dicky", style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text("Siswa Aktif", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}