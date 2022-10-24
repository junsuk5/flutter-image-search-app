import 'package:flutter/material.dart';
import 'package:image_search_app5/data/model/photo.dart';

class DetailScreen extends StatelessWidget {
  final Photo photo;

  const DetailScreen({required this.photo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.tags ?? ''),
      ),
      body: Column(
        children: [
          Hero(
            tag: '${photo.id}',
            child: Image.network(photo.webformatURL ?? ''),
          ),
          Row(
            children: [
              const Icon(Icons.thumb_up),
              Text('${photo.likes ?? 0}'),
            ],
          ),
        ],
      ),
    );
  }
}
