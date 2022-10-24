import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_search_app5/ui/search/search_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final viewModel = SearchViewModel();

  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                hintText: 'Search',
                suffixIcon: IconButton(
                  onPressed: () async {
                    log('클릭!!!!');

                    setState(() {
                      viewModel.isLoading = true;
                    });

                    await viewModel.getPhotos(searchController.text);

                    setState(() {
                      viewModel.isLoading = false;
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
              child: viewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.count(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      children: viewModel.items.map((item) {
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
