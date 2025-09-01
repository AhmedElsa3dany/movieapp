import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarch/core/constants/api_constant.dart';
import 'package:cleanarch/movies/domain/entities/movie.dart';
import 'package:cleanarch/movies/presentation/screens/movie_deatails_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class TopRatedCard extends StatelessWidget {
  const TopRatedCard(
      {super.key,
      required this.movie,
      required this.height,
      required this.width});
  final Movie movie;
  final double height;
  final double width;

  static final customCacheManager = CacheManager(
    Config(
      'movieCache',
      stalePeriod: const Duration(days: 5),
      maxNrOfCacheObjects: 100,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDeatailsScreen(
                  id: movie.id,
                ),
              ));
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                ApiConstant.imageUrl(path: movie.backdrop_path),
                cacheManager: customCacheManager,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
