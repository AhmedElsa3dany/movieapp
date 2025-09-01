import 'package:cleanarch/core/errors/failures.dart';
import 'package:cleanarch/movies/domain/entities/movie.dart';
import 'package:cleanarch/movies/domain/repository/base_movie_repositroy.dart';
import 'package:dartz/dartz.dart';

class GetPopularMoviesUseCase {
  final BaseMovieRepository basemovieRepositroy;

  GetPopularMoviesUseCase(this.basemovieRepositroy);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await basemovieRepositroy.getPopularMovies();
  }
}
