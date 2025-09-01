import 'package:equatable/equatable.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetSearchMovieEvent extends SearchMoviesEvent {
  final String query;

  const GetSearchMovieEvent(this.query);

  @override
  List<Object> get props => [query];
}
