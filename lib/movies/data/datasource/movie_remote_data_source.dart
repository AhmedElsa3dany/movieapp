import 'package:cleanarch/core/constants/api_constant.dart';
import 'package:cleanarch/movies/data/models/movie_details_model.dart';
import 'package:cleanarch/movies/data/models/movie_model.dart';
import 'package:cleanarch/movies/data/models/recommendation_model.dart';
import 'package:cleanarch/movies/data/models/search_model.dart';

import 'package:dio/dio.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopularMovie();
  Future<List<MovieModel>> getTopRatedMovie();
  Future<MovieDetailsModel> getMovieDetails({required int id});
  Future<List<RecommendationModel>> getRecommendationMovies({required int id});
  Future<List<SearchModel>> GetSearchMovie({required String query});
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSource(this.dio);

  Future<List<MovieModel>> get_movie({
    required String url,
  }) async {
    Response response = await dio.get(url);
    List<dynamic> data = response.data["results"];
    List<MovieModel> movielist = [];
    for (int i = 0; i < data.length; i++) {
      movielist.add(MovieModel.fromjson(data[i]));
    }
    return movielist;
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    return await get_movie(url: ApiConstant.now_playing_endpoint);
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    return get_movie(url: ApiConstant.popular_endpoint);
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    return get_movie(url: ApiConstant.top_rated_endpoint);
  }

  @override
  Future<MovieDetailsModel> getMovieDetails({required int id}) async {
    Response response =
        await dio.get(ApiConstant.movie_details_endpoint(id: id));
    Map<String, dynamic> data = response.data;

    return MovieDetailsModel.fromjson(data);
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(
      {required int id}) async {
    Response response =
        await dio.get(ApiConstant.recommendation_endpoint(id: id));
    List<dynamic> data = response.data["results"];
    List<RecommendationModel> movielist = [];
    for (int i = 0; i < data.length; i++) {
      movielist.add(RecommendationModel.fromjson(data[i]));
    }
    return movielist;
  }

  @override
  Future<List<SearchModel>> GetSearchMovie({required String query}) async {
    Response response =
        await dio.get(ApiConstant.search_movie_endpoint(query: query));
    List<dynamic> data = response.data["results"];
    List<SearchModel> movielist = [];
    for (int i = 0; i < data.length; i++) {
      movielist.add(SearchModel.fromjson(data[i]));
    }
    return movielist;
  }
}
