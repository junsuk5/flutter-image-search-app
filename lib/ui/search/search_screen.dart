import 'dart:developer';

import 'package:flutter/material.dart';

import '../../data/model/photo.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Photo> items = [
    Photo(
      webformatURL:
          'https://pixabay.com/get/gd0f4fb2f0ae0fcfbe838c00b0410c6a6b4b80e80112e184376fedf4512e91e304bf0576e87aaeb68d60a09e50065ed3a7f4ea1d746ca953880bd7dc88b324555_1280.jpg',
    ),
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
                      items.add(
                        Photo(
                          webformatURL:
                          'https://pixabay.com/get/gd0f4fb2f0ae0fcfbe838c00b0410c6a6b4b80e80112e184376fedf4512e91e304bf0576e87aaeb68d60a09e50065ed3a7f4ea1d746ca953880bd7dc88b324555_1280.jpg',
                        ),
                      );
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
                      item.webformatURL ?? '',
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
