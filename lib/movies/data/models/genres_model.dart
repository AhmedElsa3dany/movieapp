import 'package:cleanarch/movies/domain/entities/genres.dart';

class GenresModel extends Genres {
  GenresModel({
    required super.id,
    required super.name,
  });

  factory GenresModel.fromjson(json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
