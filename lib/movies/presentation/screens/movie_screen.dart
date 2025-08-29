import 'package:cleanarch/core/utils/enum.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_event.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_state.dart';
import 'package:cleanarch/movies/presentation/widgets/movie_list.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // عشان تخلي الـ body يبان ورا الـ AppBar
      appBar: AppBar(
        title: const Text("Now Playing"),
        backgroundColor: Colors.transparent, // شفاف
        elevation: 0, // يشيل الظل اللي تحت الـ AppBar
      ),
      body: BlocBuilder<MoviesBloc, MovieState>(
        builder: (context, state) {
          if (state.nowPlayingState == RequestState.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.nowPlayingState == RequestState.loaded) {
            return MovieList(
              movies: state.nowPlayingMovie,
            );
          } else {
            return Center(child: Text(state.nowplayingerrorMessage));
          }
        },
      ),
    );
  }
}
