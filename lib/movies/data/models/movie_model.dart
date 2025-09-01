import 'package:cleanarch/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.backdrop_path,
    required super.genre_ids,
    required super.id,
    required super.title,
    required super.overview,
    required super.vote_average,
    required super.poster_path,
  });

  factory MovieModel.fromjson(json) {
    return MovieModel(
      backdrop_path: json['backdrop_path'],
      genre_ids: List.from(json['genre_ids'].map((e) => e)),
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      vote_average: json['vote_average'],
      poster_path: json['poster_path'],
    );
  }
}
