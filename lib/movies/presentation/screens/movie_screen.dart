import 'package:cleanarch/core/constants/app_colors.dart';
import 'package:cleanarch/core/constants/app_styles.dart';
import 'package:cleanarch/core/utils/enum.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_event.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_state.dart';
import 'package:cleanarch/movies/presentation/screens/popular_movie_screen.dart';
import 'package:cleanarch/movies/presentation/screens/search_screen.dart';
import 'package:cleanarch/movies/presentation/screens/top_rated_movie_screen.dart';
import 'package:cleanarch/movies/presentation/widgets/custom_list_tile.dart';
import 'package:cleanarch/movies/presentation/widgets/now_playing_movie_list.dart';
import 'package:cleanarch/movies/presentation/widgets/popular_movie_list.dart';
import 'package:cleanarch/movies/presentation/widgets/top_rated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesBloc>().add(GetNowPlayingEvent());
    context.read<MoviesBloc>().add(GetPopularEvent());
    context.read<MoviesBloc>().add(GetTopRatedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.circle_rounded,
              size: 20,
              color: AppColors.kCardColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Now Playing".toUpperCase(),
              style: AppStyles.headline_text(),
            ),
            Expanded(child: SizedBox()),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                icon: Icon(
                  Icons.search,
                  size: 40,
                  color: AppColors.kCardColor,
                ))
          ],
        ),
        backgroundColor: const Color.fromARGB(0, 43, 42, 42),
        elevation: 0,
      ),
      body: BlocBuilder<MoviesBloc, MovieState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (state.nowPlayingState == RequestState.loading)
                const SliverToBoxAdapter(
                  child:
                      Center(child: Center(child: CircularProgressIndicator())),
                )
              else if (state.nowPlayingState == RequestState.loaded)
                SliverToBoxAdapter(child: buildNowPlayingWidget(state))
              else
                SliverToBoxAdapter(
                  child: Center(child: Text(state.nowplayingerrorMessage)),
                ),
              //-----------------------------------------------------------------

              SliverToBoxAdapter(
                  child: CustomListTile(
                title: "Popular Movies",
                subtitle: "Discover the most trending and popular movies",
                icon: Icons.arrow_right_rounded,
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PopularMovieScreen(),
                      ));
                },
              )),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),

              //-----------------------------------------------------

              if (state.popularState == RequestState.loading)
                const SliverToBoxAdapter(
                  child:
                      Center(child: Center(child: CircularProgressIndicator())),
                )
              else if (state.popularState == RequestState.loaded)
                SliverToBoxAdapter(child: buildPopularWidget(state))
              else
                SliverToBoxAdapter(
                  child: Center(child: Text(state.nowplayingerrorMessage)),
                ),
              //-----------------------------------------------------------------------
              SliverToBoxAdapter(
                  child: CustomListTile(
                title: "Top Rated ",
                subtitle: "Discover the most Rating and Top movies",
                icon: Icons.arrow_right_rounded,
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopRatedMovieScreen(),
                      ));
                },
              )),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),

              if (state.topratedState == RequestState.loading)
                const SliverToBoxAdapter(
                  child:
                      Center(child: Center(child: CircularProgressIndicator())),
                )
              else if (state.topratedState == RequestState.loaded)
                SliverToBoxAdapter(child: buildTopRatedWidget(state))
              else
                SliverToBoxAdapter(
                  child: Center(child: Text(state.nowplayingerrorMessage)),
                ),
            ],
          );
        },
      ),
    );
  }

  buildNowPlayingWidget(MovieState state) {
    final movies = state.nowPlayingMovie;

    return NowPlayingMovieList(movies: movies);
  }

  buildPopularWidget(MovieState state) {
    final movies = state.popularMovie;
    return PopularMovieList(
      movielist: movies,
    );
  }

  buildTopRatedWidget(MovieState state) {
    final movies = state.topratedMovie;

    return TopRatedList(movielist: movies);
  }
}
