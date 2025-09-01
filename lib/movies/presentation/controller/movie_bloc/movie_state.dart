import 'package:cleanarch/core/utils/enum.dart';
import 'package:cleanarch/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingState;
  final String nowplayingerrorMessage;

  final List<Movie> popularMovie;
  final RequestState popularState;
  final String popularerrorMessage;

  final List<Movie> topratedMovie;
  final RequestState topratedState;
  final String topratederrorMessage;

  const MovieState({
    this.nowPlayingMovie = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowplayingerrorMessage = '',
    this.popularMovie = const [],
    this.popularState = RequestState.loading,
    this.popularerrorMessage = '',
    this.topratedMovie = const [],
    this.topratedState = RequestState.loading,
    this.topratederrorMessage = '',
  });

  MovieState copyWith({
    List<Movie>? nowPlayingMovie,
    RequestState? nowPlayingState,
    String? nowplayingerrorMessage,
    List<Movie>? popularMovie,
    RequestState? popularState,
    String? popularerrorMessage,
    List<Movie>? topratedMovie,
    RequestState? topratedState,
    String? topratederrorMessage,
  }) {
    return MovieState(
      nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowplayingerrorMessage:
          nowplayingerrorMessage ?? this.nowplayingerrorMessage,
      popularMovie: popularMovie ?? this.popularMovie,
      popularState: popularState ?? this.popularState,
      popularerrorMessage: popularerrorMessage ?? this.popularerrorMessage,
      topratedMovie: topratedMovie ?? this.topratedMovie,
      topratedState: topratedState ?? this.topratedState,
      topratederrorMessage: topratederrorMessage ?? this.topratederrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovie,
        nowPlayingState,
        nowplayingerrorMessage,
        popularMovie,
        popularState,
        popularerrorMessage,
        topratedMovie,
        topratedState,
        topratederrorMessage,
      ];
}
