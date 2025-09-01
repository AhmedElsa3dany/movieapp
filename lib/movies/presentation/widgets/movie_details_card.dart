import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarch/core/constants/api_constant.dart';
import 'package:cleanarch/movies/domain/entities/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MovieDetailsCard extends StatelessWidget {
  const MovieDetailsCard(
      {super.key,
      required this.height,
      required this.width,
      required this.movie});

  final double height;
  final double width;
  final MovieDetails movie;

  static final customCacheManager = CacheManager(
    Config(
      'movieCache',
      stalePeriod: const Duration(days: 5),
      maxNrOfCacheObjects: 100,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(50),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            ApiConstant.imageUrl(path: movie.poster_path),
            cacheManager: customCacheManager,
          ),
        ),
      ),
    );
  }
}
