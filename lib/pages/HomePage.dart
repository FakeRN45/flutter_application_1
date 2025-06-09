import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> quizzes = ['Sosiologi', 'Sejarah', 'Ekonomi', 'Geografi'];
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 8),
              child: Row(
                children: [
                  // CircleAvatar(radius:24, backgroundImage: AssetImage('assets/profile.png')),
                  const SizedBox(width:12),
                  const Expanded(child: Text('', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold))),
                  IconButton(onPressed: () => Navigator.pushNamed(context,'/favorit'),
                           icon: const Icon(Icons.person)),
                ],
              ),
            ),
            const Divider(thickness: 3),
            const Padding(
              padding: EdgeInsets.symmetric(vertical:12, horizontal:16),
              child: Align(alignment: Alignment.centerLeft,
                child: Text('Saran Quiz Untuk Anda', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold))),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal:16),
                itemCount: quizzes.length,
                itemBuilder: (ctx,i) {
                  return Card(
                    margin: const EdgeInsets.only(bottom:16),
                    child: ListTile(
                      leading: Image.asset('assets/quiz.png', width:60),
                      title: Text('${quizzes[i]} - Kerjakan'),
                      trailing: ElevatedButton(onPressed: () {}, child: const Text('Kerjakan')),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}