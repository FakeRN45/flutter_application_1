import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
import 'pages/SearchPage.dart';
import 'pages/QuizListPage.dart';
import 'pages/FavoritPage.dart';
import 'pages/QuizLevelPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/search': (_) => const SearchPage(),
        '/quiz-list': (_) => const QuizListPage(),
        '/favorit': (_) => const FavoritPage(),
        '/level': (_) => const QuizLevelPage(),
      },
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const QuizListPage(),
    const FavoritPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue[900],
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.black,
        onTap: (idx) => setState(() => _currentIndex = idx),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pencarian'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Quiz'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Favorit'),
        ],
      ),
    );
  }
}