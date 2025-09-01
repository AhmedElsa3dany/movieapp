import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarch/core/constants/api_constant.dart';
import 'package:cleanarch/core/constants/app_colors.dart';
import 'package:cleanarch/core/constants/app_styles.dart';
import 'package:cleanarch/core/utils/enum.dart';
import 'package:cleanarch/movies/presentation/controller/search_bloc/seach_event.dart';
import 'package:cleanarch/movies/presentation/controller/search_bloc/seach_state.dart';
import 'package:cleanarch/movies/presentation/controller/search_bloc/search_bloc.dart';
import 'package:cleanarch/movies/presentation/screens/movie_deatails_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search Movies",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          children: [
            TextField(
              controller: textController,
              onChanged: (query) {
                if (query.trim().isNotEmpty) {
                  context
                      .read<SearchMoviesBloc>()
                      .add(GetSearchMovieEvent(query.trim()));
                }
              },
              decoration: InputDecoration(
                hintText: "Movies Name",
                hintStyle: AppStyles.overview_text(size: screenWidth * 0.045),
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColors.kText3Color,
                  size: screenWidth * 0.08,
                ),
                filled: true,
                fillColor: AppColors.kTextColor,
                contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.01,
                    horizontal: screenWidth * 0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
                builder: (context, state) {
                  switch (state.searchMovieState) {
                    case RequestState.loading:
                      return Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Start Searching",
                            style: AppStyles.subtitle_text(
                                size: screenWidth * 0.07),
                          ),
                        ),
                      );

                    case RequestState.loaded:
                      if (state.searchMovie.isEmpty) {
                        return Center(
                          child: Text(
                            "No Movies",
                            style: AppStyles.subtitle_text(
                                size: screenWidth * 0.07),
                          ),
                        );
                      }
                      return ListView.separated(
                        itemCount: state.searchMovie.length,
                        separatorBuilder: (_, __) =>
                            SizedBox(height: screenHeight * 0.02),
                        itemBuilder: (context, index) {
                          final movie = state.searchMovie[index];
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
                              decoration: BoxDecoration(
                                color: AppColors.kText3Color,
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.04),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(screenWidth * 0.04),
                                      bottomLeft:
                                          Radius.circular(screenWidth * 0.04),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: ApiConstant.imageUrl(
                                          path: movie.poster_path),
                                      width: screenWidth * 0.28,
                                      height: screenHeight * 0.25,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                          color: Colors.grey.shade300),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.03),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: screenHeight * 0.015,
                                          horizontal: screenWidth * 0.02),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movie.title,
                                            style: AppStyles.headline_text(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: screenHeight * 0.01),
                                          Text(
                                            movie.overview,
                                            style: AppStyles.subtitle_text(
                                                size: screenWidth * 0.04),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );

                    case RequestState.error:
                      return Center(
                        child: Text(
                          "No movies",
                          style:
                              AppStyles.subtitle_text(size: screenWidth * 0.07),
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
