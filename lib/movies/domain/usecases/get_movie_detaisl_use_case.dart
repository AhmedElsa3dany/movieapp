import 'package:cleanarch/core/errors/failures.dart';
import 'package:cleanarch/movies/domain/entities/movie_details.dart';
import 'package:cleanarch/movies/domain/repository/base_movie_repositroy.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetaislUseCase {
  final BaseMovieRepository basemovieRepositroy;

  GetMovieDetaislUseCase(this.basemovieRepositroy);

  Future<Either<Failure, MovieDetails>> execute({required int id}) async {
    return await basemovieRepositroy.getMovieDetails(id: id);
  }
}
