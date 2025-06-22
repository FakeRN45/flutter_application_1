import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchResult = '';

  final List<String> categories = ['IPA', 'IPS', 'MTK', 'INDO'];
  String selectedCategory = '';

  void _performSearch(String query) {
    setState(() {
      _searchResult = query;
    });
    print('Searching for: $query');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // kembali ke HomePage
          },
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Icon(Icons.person_outline, size: 30),
              Text("Profile", style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _performSearch,
                      decoration: const InputDecoration(
                        hintText: 'search',
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        prefixIcon: Icon(Icons.search, color: Colors.purple),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(children: const [Text("Filter by"), Icon(Icons.filter_list)]),
              ],
            ),
            const SizedBox(height: 16),
            const Text("Kategori :", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: categories.map((category) {
                final isSelected = category == selectedCategory;
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Colors.indigo[700] : Colors.indigo[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Text(category),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            if (_searchResult.isNotEmpty)
              Text('Hasil pencarian untuk: $_searchResult'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pencarian'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Favorit'),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
          // Tambahkan else if jika ingin navigasi ke menu lain
        },
      ),
    );
  }
}