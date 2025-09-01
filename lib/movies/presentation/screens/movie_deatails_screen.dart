import 'package:cleanarch/core/constants/app_styles.dart';
import 'package:cleanarch/core/utils/enum.dart';
import 'package:cleanarch/core/utils/formate_runtime.dart';
import 'package:cleanarch/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:cleanarch/movies/presentation/controller/movie_details_bloc/movie_details_event.dart';
import 'package:cleanarch/movies/presentation/controller/movie_details_bloc/movie_details_state.dart';
import 'package:cleanarch/movies/presentation/widgets/custom_card.dart';
import 'package:cleanarch/movies/presentation/widgets/movie_details_card.dart';
import 'package:cleanarch/movies/presentation/widgets/recommendation_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDeatailsScreen extends StatefulWidget {
  final int id;
  const MovieDeatailsScreen({super.key, required this.id});

  @override
  State<MovieDeatailsScreen> createState() => _MovieDeatailsScreenState();
}

class _MovieDeatailsScreenState extends State<MovieDeatailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsBloc>().add(GetMovieDetailsEvent(widget.id));
    context
        .read<MovieDetailsBloc>()
        .add(GetMovieRecommendationEvent(widget.id));

    context.read<MovieDetailsBloc>().add(ResetMovieDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Movie Details Section
            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                if (state.movieDetailsState == RequestState.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.movieDetailsState == RequestState.loaded) {
                  final movie = state.movieDetail!;
                  return Column(
                    children: [
                      /// Poster + Backdrop
                      MovieDetailsCard(
                        height: size.height * 0.65,
                        width: size.width,
                        movie: movie,
                      ),

                      const SizedBox(height: 10),

                      // Vote & Duration
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ("⭐ ${movie.vote_average.toStringAsFixed(1)}"),
                              style: AppStyles.number_text(),
                            ),
                            Expanded(child: SizedBox()),
                            CustomCard(
                                text: "🕓 ${formatRuntime(movie.runtime)}"),
                          ],
                        ),
                      ),

                      const SizedBox(height: 5),

                      // Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Center(
                            child: Text(
                              movie.title.toUpperCase(),
                              style: AppStyles.title_text(),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// Genres
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 45,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movie.genres.length,
                            itemBuilder: (context, index) {
                              final genre = movie.genres[index].name;
                              return CustomCard(text: genre);
                            },
                          ),
                        ),
                      ),

                      /// Overview
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          textAlign: TextAlign.justify,
                          movie.overview,
                          style: AppStyles.overview_text(size: 15),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text(state.movieDetailsMessage),
                  );
                }
              },
            ),

            const SizedBox(height: 20),

            // Recommendation Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("More Like This".toUpperCase(),
                    style: AppStyles.headline_text()),
              ),
            ),

            const SizedBox(height: 10),

            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                if (state.recommendationState == RequestState.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.recommendationState == RequestState.loaded) {
                  return SizedBox(
                    height: size.height * 0.3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.recommendation.length,
                      itemBuilder: (context, index) {
                        final recommendation = state.recommendation[index];
                        return RecommendationCard(
                          height: size.height * 0.3,
                          width: size.width * 0.5,
                          movie: recommendation,
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text(state.recommendationMessage),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
