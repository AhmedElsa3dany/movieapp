import 'package:cleanarch/core/errors/failures.dart';
import 'package:cleanarch/movies/domain/entities/Recommendation.dart';
import 'package:cleanarch/movies/domain/entities/movie.dart';
import 'package:cleanarch/movies/domain/entities/movie_details.dart';
import 'package:cleanarch/movies/domain/entities/search.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails({required int id});
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(
      {required int id});
  Future<Either<Failure, List<Search>>> getSearchMovie({required String query});
}
