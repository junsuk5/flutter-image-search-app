import 'photo.dart';

class PhotoResult {
  PhotoResult({
      this.total, 
      this.totalHits, 
      this.hits,});

  PhotoResult.fromJson(dynamic json) {
    total = json['total'];
    totalHits = json['totalHits'];
    if (json['hits'] != null) {
      hits = [];
      json['hits'].forEach((v) {
        hits?.add(Photo.fromJson(v));
      });
    }
  }
  num? total;
  num? totalHits;
  List<Photo>? hits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['totalHits'] = totalHits;
    if (hits != null) {
      map['hits'] = hits?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}