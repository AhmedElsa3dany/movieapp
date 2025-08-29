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
