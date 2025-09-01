import 'package:cleanarch/core/utils/enum.dart';
import 'package:cleanarch/movies/domain/entities/search.dart';
import 'package:equatable/equatable.dart';

class SearchMoviesState extends Equatable {
  const SearchMoviesState({
    this.searchMovie = const [],
    this.searchMovieState = RequestState.loading,
    this.searchMovieStateErrorMessage = '',
  });

  final List<Search> searchMovie;
  final RequestState searchMovieState;
  final String searchMovieStateErrorMessage;

  SearchMoviesState copyWith({
    List<Search>? searchMovie,
    RequestState? searchMovieState,
    String? searchMovieStateErrorMessage,
  }) {
    return SearchMoviesState(
      searchMovie: searchMovie ?? this.searchMovie,
      searchMovieState: searchMovieState ?? this.searchMovieState,
      searchMovieStateErrorMessage:
          searchMovieStateErrorMessage ?? this.searchMovieStateErrorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [searchMovie, searchMovieState, searchMovieStateErrorMessage];
}
