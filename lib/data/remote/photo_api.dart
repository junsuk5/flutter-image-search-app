import 'dart:convert';

import 'package:image_search_app5/data/model/photo_result.dart';

import '../model/photo.dart';

import 'package:http/http.dart' as http;

class PhotoApi {
  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo&pretty=true'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final result = PhotoResult.fromJson(jsonResponse);

      if (result.hits == null) {
        throw Exception('검색 결과 없음');
      }

      return result.hits!;
    } else {
      throw Exception('죽어 statusCode : ${response.statusCode}');
    }
  }
}
