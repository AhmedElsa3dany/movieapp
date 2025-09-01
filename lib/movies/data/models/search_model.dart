import 'package:cleanarch/movies/domain/entities/search.dart';

class SearchModel extends Search {
  SearchModel(
      {required super.id,
      required super.title,
      required super.poster_path,
      required super.overview});

  factory SearchModel.fromjson(json) {
    return SearchModel(
        id: json['id'],
        title: json['title'],
        poster_path: json['poster_path'],
        overview: json['overview']);
  }
}
