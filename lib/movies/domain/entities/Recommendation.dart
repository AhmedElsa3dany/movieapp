import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String poster_path;
  final int id;

  const Recommendation({required this.poster_path, required this.id});

  @override
  List<Object?> get props => [id, poster_path];
}
