import 'dart:async';
import 'package:cleanarch/movies/domain/usecases/get_search_movie_use_case.dart';
import 'package:cleanarch/movies/presentation/controller/search_bloc/seach_event.dart';
import 'package:cleanarch/movies/presentation/controller/search_bloc/seach_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cleanarch/core/utils/enum.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final GetSearchMovieUseCase getSearchMovieUseCase;

  SearchMoviesBloc(this.getSearchMovieUseCase)
      : super(const SearchMoviesState()) {
    on<GetSearchMovieEvent>(getSearchMovies);
  }

  FutureOr<void> getSearchMovies(
      GetSearchMovieEvent event, Emitter<SearchMoviesState> emit) async {
    emit(state.copyWith(searchMovieState: RequestState.loading));

    final result = await getSearchMovieUseCase.execute(query: event.query);

    result.fold(
      (l) => emit(
        state.copyWith(
          searchMovieState: RequestState.error,
          searchMovieStateErrorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          searchMovie: r,
          searchMovieState: RequestState.loaded,
        ),
      ),
    );
  }
}
