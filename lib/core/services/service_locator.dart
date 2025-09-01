import 'package:cleanarch/movies/data/datasource/movie_remote_data_source.dart';
import 'package:cleanarch/movies/data/repository/movie_repository.dart';
import 'package:cleanarch/movies/domain/repository/base_movie_repositroy.dart';
import 'package:cleanarch/movies/domain/usecases/get_movie_detaisl_use_case.dart';
import 'package:cleanarch/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:cleanarch/movies/domain/usecases/get_popular_movies.dart';
import 'package:cleanarch/movies/domain/usecases/get_recommendatio_use_case.dart';
import 'package:cleanarch/movies/domain/usecases/get_search_movie_use_case.dart';
import 'package:cleanarch/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:cleanarch/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:cleanarch/movies/presentation/controller/search_bloc/search_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // Bloc
    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));

    sl.registerFactory(() => MovieDetailsBloc(
          sl(),
          sl(),
        ));
    sl.registerFactory(() => SearchMoviesBloc(
          sl(),
        ));
    // usecase
    sl.registerLazySingleton(() => GetSearchMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendatioUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetaislUseCase(sl()));
    sl.registerLazySingleton(() => GetNowPlayingUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    //repository

    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    // data source

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource(sl()));

    // Dio

    sl.registerLazySingleton<Dio>(() => Dio());
  }
}
