import 'package:cleanarch/movies/domain/entities/movie.dart';
import 'package:cleanarch/movies/presentation/widgets/top_rated_card.dart';
import 'package:flutter/material.dart';

class TopRatedList extends StatelessWidget {
  const TopRatedList({super.key, required this.movielist});
  final List<Movie> movielist;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: ListView.builder(
        itemCount: movielist.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TopRatedCard(
            movie: movielist[index],
            height: size.height * 0.2,
            width: size.width * 0.65,
          );
        },
      ),
    );
  }
}
