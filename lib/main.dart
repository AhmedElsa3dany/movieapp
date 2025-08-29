import 'package:cleanarch/core/services/service_locator.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:cleanarch/movies/presentation/screens/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  ServiceLocator().init();
  runApp(Movie_App());
}

class Movie_App extends StatelessWidget {
  const Movie_App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<MoviesBloc>();
      },
      child: MaterialApp(
        home: MovieScreen(),
      ),
    );
  }
}
