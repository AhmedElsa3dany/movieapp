import 'package:cleanarch/core/errors/failures.dart';
import 'package:cleanarch/movies/data/datasource/movie_remote_data_source.dart';
import 'package:cleanarch/movies/domain/entities/Recommendation.dart';
import 'package:cleanarch/movies/domain/entities/movie.dart';
import 'package:cleanarch/movies/domain/entities/movie_details.dart';
import 'package:cleanarch/movies/domain/entities/search.dart';
import 'package:cleanarch/movies/domain/repository/base_movie_repositroy.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getNowPlayingMovie();
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getPopularMovie();
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getTopRatedMovie();
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      {required int id}) async {
    try {
      final result = await baseMovieRemoteDataSource.getMovieDetails(id: id);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(
      {required int id}) async {
    try {
      final result =
          await baseMovieRemoteDataSource.getRecommendationMovies(id: id);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Search>>> getSearchMovie(
      {required String query}) async {
    try {
      final result =
          await baseMovieRemoteDataSource.GetSearchMovie(query: query);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
