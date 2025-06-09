import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCat = '';
  final List<String> cats = ['IPS','JJS','MTK','INDO'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back)),
                const Spacer(),
                IconButton(onPressed: () => Navigator.pushNamed(context,'/favorit'),
                  icon: const Icon(Icons.person)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            const SizedBox(height:8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16),
              child: Align(alignment: Alignment.centerLeft,
                child: const Text('Filter by', style: TextStyle(fontSize:16, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(height:8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16),
              child: Wrap(
                spacing:8,
                children: cats.map((c) =>
                  FilterChip(
                    label: Text(c),
                    selected: selectedCat == c,
                    onSelected: (sel) => setState(() => selectedCat = sel ? c : ''),
                  )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}