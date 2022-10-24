import '../../data/model/photo.dart';
import '../../data/remote/photo_api.dart';

class SearchViewModel {
  final _api = PhotoApi();

  bool isLoading = false;

  List<Photo> items = [];

  Future<void> getPhotos(String query) async {
    items = await _api.fetch(query);
  }
}