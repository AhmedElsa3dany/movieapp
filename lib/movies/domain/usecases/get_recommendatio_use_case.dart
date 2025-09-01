import 'package:cleanarch/core/errors/failures.dart';
import 'package:cleanarch/movies/domain/entities/Recommendation.dart';
import 'package:cleanarch/movies/domain/repository/base_movie_repositroy.dart';
import 'package:dartz/dartz.dart';

class GetRecommendatioUseCase {
  final BaseMovieRepository basemovieRepositroy;

  GetRecommendatioUseCase(this.basemovieRepositroy);

  Future<Either<Failure, List<Recommendation>>> execute(
      {required int id}) async {
    return await basemovieRepositroy.getRecommendationMovies(id: id);
  }
}
