import 'package:cleanarch/movies/data/models/genres_model.dart';
import 'package:cleanarch/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.poster_path,
      required super.overview,
      required super.title,
      required super.id,
      required super.vote_average,
      required super.runtime,
      required super.release_date,
      required super.genres});

  factory MovieDetailsModel.fromjson(json) {
    return MovieDetailsModel(
      poster_path: json['poster_path'],
      overview: json['overview'],
      title: json['title'],
      id: json['id'],
      vote_average: json['vote_average'].toDouble(),
      runtime: json['runtime'],
      release_date: json['release_date'],
      genres: List<GenresModel>.from(
        json['genres'].map((x) => GenresModel.fromjson(x)),
      ),
    );
  }
}
