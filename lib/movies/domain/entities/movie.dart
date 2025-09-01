import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String backdrop_path;
  final List<int> genre_ids;
  final int id;
  final String title;
  final String overview;
  final double vote_average;
  final String poster_path;

  const Movie({
    required this.poster_path,
    required this.backdrop_path,
    required this.genre_ids,
    required this.id,
    required this.title,
    required this.overview,
    required this.vote_average,
  });

  @override
  List<Object?> get props => [
        id,
        backdrop_path,
        genre_ids,
        title,
        overview,
        vote_average,
        poster_path,
      ];
}
