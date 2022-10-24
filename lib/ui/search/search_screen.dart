import 'dart:developer';

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> items = [
    'https://w.namu.la/s/db95e8529db90e3ad7c75b6d7ea8506b7a4a6f0d547810cc6ab1aa8c7f063f848a56c4f93636c7fa53e81f5fe00a3374df82f3d4b38372669e466cad41c3ea9f36b7e06acae147f61a6142966e9502579f5b99450e1e67680736bfc28d3e1691f32f8241a53fd0fca69b69e08f6ba77d',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkuJyRbsAoB5R-bJGrvioblBJUrWqkwvf7P9OFHCIt&s',
    'https://w.namu.la/s/59bbf73b123d0f9f693be3c3de9506b24a1f2a3067b4ffd0207a3a08eee32d750ebf1ca3e33084aa3bbcd6916bd0a8a187cc4556b87fa269c25f1a7ff3ea279f1e372d23aa0a6eee8d5932c70d5dac0e7abffa01167a69808aa4f31525eb198262eab6b13087d731f9aceaba1343d08b',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색 앱'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                hintText: 'Search',
                suffixIcon: IconButton(
                  onPressed: () {
                    log('클릭!!!!');

                    setState(() {
                      items.add('https://w.namu.la/s/59bbf73b123d0f9f693be3c3de9506b24a1f2a3067b4ffd0207a3a08eee32d750ebf1ca3e33084aa3bbcd6916bd0a8a187cc4556b87fa269c25f1a7ff3ea279f1e372d23aa0a6eee8d5932c70d5dac0e7abffa01167a69808aa4f31525eb198262eab6b13087d731f9aceaba1343d08b');
                    });

                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
                children: items.map((item) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
