import 'package:cleanarch/core/utils/enum.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_event.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_state.dart';
import 'package:cleanarch/movies/presentation/widgets/popular_movie_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMovieScreen extends StatefulWidget {
  const PopularMovieScreen({super.key});

  @override
  State<PopularMovieScreen> createState() => _PopularMovieScreenState();
}

class _PopularMovieScreenState extends State<PopularMovieScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesBloc>().add(GetPopularEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "TRENDING MOVIE ",
        ),
      ),
      body: BlocBuilder<MoviesBloc, MovieState>(
        builder: (context, state) {
          if (state.popularState == RequestState.loading) {
            return Center(child: Center(child: CircularProgressIndicator()));
          } else if (state.popularState == RequestState.loaded) {
            return PopularMovieGrid(movielist: state.popularMovie);
          } else {
            return Center(child: Text(state.nowplayingerrorMessage));
          }
        },
      ),
    );
  }
}
