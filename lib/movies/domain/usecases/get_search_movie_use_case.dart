import 'package:cleanarch/core/errors/failures.dart';
import 'package:cleanarch/movies/domain/entities/search.dart';
import 'package:cleanarch/movies/domain/repository/base_movie_repositroy.dart';
import 'package:dartz/dartz.dart';

class GetSearchMovieUseCase {
  final BaseMovieRepository basemovieRepositroy;

  GetSearchMovieUseCase(this.basemovieRepositroy);

  Future<Either<Failure, List<Search>>> execute({required String query}) async {
    return await basemovieRepositroy.getSearchMovie(query: query);
  }
}
