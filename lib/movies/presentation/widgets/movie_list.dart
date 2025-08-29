import 'package:cleanarch/movies/domain/entities/movie.dart';
import 'package:cleanarch/movies/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.75,
      child: PageView.builder(
        itemCount: movies.length,
        controller: PageController(
          viewportFraction:
              1, // تخلي الكارد يظهر بشكل أوضح مع جزء صغير من اللي بعده
        ),
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movies[index],
          );
        },
      ),
    );
  }
}
