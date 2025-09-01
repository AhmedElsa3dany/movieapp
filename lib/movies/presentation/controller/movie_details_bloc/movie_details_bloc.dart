import 'dart:async';

import 'package:cleanarch/core/utils/enum.dart';
import 'package:cleanarch/movies/domain/usecases/get_movie_detaisl_use_case.dart';
import 'package:cleanarch/movies/domain/usecases/get_recommendatio_use_case.dart';
import 'package:cleanarch/movies/presentation/controller/movie_details_bloc/movie_details_event.dart';
import 'package:cleanarch/movies/presentation/controller/movie_details_bloc/movie_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
    on<ResetMovieDetailsEvent>(_resetMovieDetails);
  }

  final GetMovieDetaislUseCase getMovieDetailsUseCase;
  final GetRecommendatioUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase.execute(id: event.id);

    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.errorMessage,
      )),
      (r) => emit(
        state.copyWith(
          movieDetail: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase.execute(id: event.id);

    result.fold(
      (l) => emit(state.copyWith(
        recommendationState: RequestState.error,
        recommendationMessage: l.errorMessage,
      )),
      (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _resetMovieDetails(
      ResetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) {
    emit(state.copyWith(
      movieDetail: null,
      movieDetailsState: RequestState.loading,
      movieDetailsMessage: '',
      recommendation: const [],
      recommendationState: RequestState.loading,
      recommendationMessage: '',
    ));
  }
}
