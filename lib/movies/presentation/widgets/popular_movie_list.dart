import 'package:cleanarch/movies/domain/entities/movie.dart';
import 'package:cleanarch/movies/presentation/widgets/popular_card.dart';
import 'package:flutter/material.dart';

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({super.key, required this.movielist});
  final List<Movie> movielist;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: ListView.builder(
        itemCount: movielist.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PopularCard(
            movie: movielist[index],
            height: size.height * 0.1,
            width: size.width * 0.4,
          );
        },
      ),
    );
  }
}
