import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final int id;
  final String title;
  final String poster_path;
  final String overview;

  const Search(
      {required this.id,
      required this.title,
      required this.poster_path,
      required this.overview});
  List<Object?> get props => [
        id,
        title,
        poster_path,
        overview,
      ];
}
