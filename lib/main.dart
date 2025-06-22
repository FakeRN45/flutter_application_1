import 'package:flutter/material.dart';
import 'pencarian.dart'; // pastikan pencarian.dart tersedia

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(username: 'Welcome'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onNavItemTapped(int index) {
    if (index == 1) {
      // Pencarian diklik, buka halaman tanpa ubah indeks
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF7FB),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF8ED0F9), Color(0xFFB2EBF2)],
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey[300],
                          child: const Icon(Icons.person, size: 36, color: Colors.black54),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            "Hi, ${widget.username} 👋",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 8,
                    right: 12,
                    child: Column(
                      children: [
                        Icon(Icons.person_outline, color: Colors.black, size: 24),
                        SizedBox(height: 2),
                        Text("Profil", style: TextStyle(fontSize: 11)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(height: 6, color: const Color(0xFF388E8E)),

            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[100],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {},
                child: const Text('Saran Quiz Untuk Anda'),
              ),
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: const [
                    QuizCard(title: 'Soal Matematika'),
                    QuizCard(title: 'Soal Wawasan Kebangsaan'),
                    QuizCard(title: 'Soal Olahraga'),
                    QuizCard(title: 'Soal Ilmu Pengetahuan Alam'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar() {
    return SafeArea(
      child: Container(
        height: 56,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8ED0F9), Color(0xFFB2EBF2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, "Beranda", 0),
            _navItem(Icons.search, "Pencarian", 1),
            _navItem(Icons.quiz, "Quiz", 2),
            _navItem(Icons.menu_book, "Favorit", 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onNavItemTapped(index),
      child: SizedBox(
        width: 60,
        height: 54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.grey[400] : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(4),
              child: Icon(
                icon,
                color: isSelected ? Colors.black : Colors.blue[900],
                size: 24,
              ),
            ),
            const SizedBox(height: 1),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.blue[900],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final String title;
  const QuizCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Image.asset('assets/quiz.png', height: 80, fit: BoxFit.contain),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Mulai quiz: $title')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text('Kerjakan'),
          ),
        ],
      ),
    );
  }
}