import 'package:flutter/material.dart';
import 'QuizLevelPage.dart';

class QuizListPage extends StatelessWidget {
  const QuizListPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> subjs = ['IPS','MATEMATIKA','BAHASA INDONESIA','AGAMA','JAWA','SENI BUDAYA'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: const Text('Mulai Quiz Anda'),
        leading: IconButton(onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context,'/favorit'),
            icon: const Icon(Icons.person)),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.lightBlue[100],
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: subjs.length,
            itemBuilder: (ctx,i) {
              return ListTile(
                title: Text(subjs[i], style: const TextStyle(fontSize:16)),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizLevelPage())),
              );
            },
          ),
        ),
      ),
    );
  }
}