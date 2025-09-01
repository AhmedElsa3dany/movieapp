import 'package:cleanarch/movies/domain/entities/movie.dart';
import 'package:cleanarch/movies/presentation/widgets/now_playing_card.dart';
import 'package:flutter/material.dart';

class NowPlayingMovieList extends StatelessWidget {
  const NowPlayingMovieList({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: PageView.builder(
        itemCount: movies.length,
        controller: PageController(
          viewportFraction: 1,
        ),
        itemBuilder: (context, index) {
          return NowPlayingCard(
            movie: movies[index],
          );
        },
      ),
    );
  }
}
