import 'package:cleanarch/core/utils/enum.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_event.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_state.dart';
import 'package:cleanarch/movies/presentation/widgets/top_rated_movie_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMovieScreen extends StatefulWidget {
  const TopRatedMovieScreen({super.key});

  @override
  State<TopRatedMovieScreen> createState() => _PopularMovieScreenState();
}

class _PopularMovieScreenState extends State<TopRatedMovieScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesBloc>().add(GetTopRatedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "TOP ⭐ MOVIE ",
        ),
      ),
      body: BlocBuilder<MoviesBloc, MovieState>(
        builder: (context, state) {
          if (state.popularState == RequestState.loading) {
            return Center(child: Center(child: CircularProgressIndicator()));
          } else if (state.popularState == RequestState.loaded) {
            return TopRatedMovieGrid(movielist: state.topratedMovie);
          } else {
            return Center(child: Text(state.nowplayingerrorMessage));
          }
        },
      ),
    );
  }
}
