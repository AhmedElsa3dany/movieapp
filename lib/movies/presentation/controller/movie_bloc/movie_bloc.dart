import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cleanarch/core/utils/enum.dart';
import 'package:cleanarch/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:cleanarch/movies/domain/usecases/get_popular_movies.dart';
import 'package:cleanarch/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_event.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_state.dart';

class MoviesBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingUsecase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MovieState()) {
    on<GetNowPlayingEvent>(_getNowPlayingMovies);
    on<GetPopularEvent>(_getPopularMovies);
    on<GetTopRatedEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPlayingMoviesUseCase.execute();

    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowplayingerrorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovie: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularEvent event, Emitter<MovieState> emit) async {
    final result = await getPopularMoviesUseCase.execute();

    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularerrorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovie: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedMoviesUseCase.execute();

    result.fold(
      (l) => emit(
        state.copyWith(
          topratedState: RequestState.error,
          topratederrorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topratedMovie: r,
          topratedState: RequestState.loaded,
        ),
      ),
    );
  }
}
