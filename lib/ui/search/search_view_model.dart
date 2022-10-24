import '../../data/model/photo.dart';

class SearchViewModel {
  bool isLoading = false;

  final List<Photo> items = [];

  Future<void> addPhoto() async {
    await Future.delayed(const Duration(seconds: 2));

    items.add(
      Photo(
        webformatURL:
        'https://pixabay.com/get/gd0f4fb2f0ae0fcfbe838c00b0410c6a6b4b80e80112e184376fedf4512e91e304bf0576e87aaeb68d60a09e50065ed3a7f4ea1d746ca953880bd7dc88b324555_1280.jpg',
      ),
    );
  }
}