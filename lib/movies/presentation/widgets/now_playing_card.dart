import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarch/core/constants/api_constant.dart';
import 'package:cleanarch/movies/domain/entities/movie.dart';
import 'package:cleanarch/movies/presentation/screens/movie_deatails_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class NowPlayingCard extends StatelessWidget {
  const NowPlayingCard({super.key, required this.movie});

  final Movie movie;

  static final customCacheManager = CacheManager(
    Config(
      'movieCache',
      stalePeriod: const Duration(days: 5),
      maxNrOfCacheObjects: 100,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
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
        height: size.height * 0.7,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          image: DecorationImage(
            fit: BoxFit.cover,
            scale: 0.5,
            image: CachedNetworkImageProvider(
              ApiConstant.imageUrl(path: movie.poster_path),
              cacheManager: customCacheManager,
            ),
          ),
        ),
      ),
    );
  }
}
