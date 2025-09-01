import 'package:cleanarch/movies/domain/entities/movie.dart';
import 'package:cleanarch/movies/presentation/widgets/top_rated_card.dart';
import 'package:flutter/material.dart';

class TopRatedMovieGrid extends StatelessWidget {
  const TopRatedMovieGrid({super.key, required this.movielist});
  final List<Movie> movielist;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 15),
      itemCount: movielist.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (context, index) {
        return TopRatedCard(
            movie: movielist[index],
            height: size.height * 0.1,
            width: size.width * 0.2);
      },
    );
  }
}
