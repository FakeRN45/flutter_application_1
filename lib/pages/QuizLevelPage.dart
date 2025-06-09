import 'package:flutter/material.dart';

class QuizLevelPage extends StatelessWidget {
  const QuizLevelPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> levels = ['Easy','Medium','Hard'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: const Text('Mulai Quiz Anda'),
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.lightBlue[100],
          padding: const EdgeInsets.all(16),
          child: Column(
            children: levels.map((lvl) =>
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300],
                    minimumSize: const Size(double.infinity,50),
                  ),
                  onPressed: () {},
                  child: Text(lvl, style: const TextStyle(fontSize:18)),
                ),
              )).toList(),
          ),
        ),
      ),
    );
  }
}