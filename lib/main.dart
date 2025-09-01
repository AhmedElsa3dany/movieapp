import 'package:cleanarch/core/constants/app_colors.dart';
import 'package:cleanarch/core/constants/app_styles.dart';
import 'package:cleanarch/core/services/service_locator.dart';
import 'package:cleanarch/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:cleanarch/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:cleanarch/movies/presentation/controller/search_bloc/search_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<MoviesBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<MovieDetailsBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchMoviesBloc>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.kBackgroundColor,
            appBarTheme: AppBarTheme(
              titleTextStyle: AppStyles.headline_text(),
              centerTitle: true,
              backgroundColor: AppColors.kBackgroundColor,
              elevation: 0,
              iconTheme: IconThemeData(
                color: AppColors.kIconColor,
                size: 28,
              ),
            )),
        home: MovieScreen(),
      ),
    );
  }
}
