import 'package:cleanarch/movies/domain/entities/genres.dart';
import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String poster_path;
  final String overview;
  final String title;
  final int id;
  final double vote_average;
  final int runtime;
  final String release_date;
  final List<Genres> genres;

  const MovieDetails({
    required this.poster_path,
    required this.overview,
    required this.title,
    required this.id,
    required this.vote_average,
    required this.runtime,
    required this.release_date,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        poster_path,
        overview,
        title,
        id,
        vote_average,
        runtime,
        release_date,
        genres,
      ];
}
