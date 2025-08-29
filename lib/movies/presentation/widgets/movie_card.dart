import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarch/core/constants/api_constant.dart';
import 'package:cleanarch/movies/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Movie movie;

  static final customCacheManager = CacheManager(
    Config(
      'movieCache',
      stalePeriod: const Duration(days: 1),
      maxNrOfCacheObjects: 100,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.75,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          scale: 0.5,
          image: CachedNetworkImageProvider(
            ApiConstant.imageUrl(path: movie.backdrop_path),
            cacheManager: customCacheManager,
          ),
        ),
      ),
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
          ),
          Text(movie.title),
          SizedBox(
            height: 10,
          ),
          Text(movie.overview.substring(0, 50)),
        ],
      ),
    );
  }
}
