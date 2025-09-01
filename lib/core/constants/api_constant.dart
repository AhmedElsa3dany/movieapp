class ApiConstant {
  static const String baseurl = 'https://api.themoviedb.org/3';
  static const String apikey = '25c4a2bcada2db7f8adbd10947e4ed49';
  static const String now_playing_endpoint =
      "$baseurl/movie/now_playing?api_key=$apikey";
  static const String popular_endpoint =
      "$baseurl/movie/popular?api_key=$apikey";
  static const String top_rated_endpoint =
      "$baseurl/movie/top_rated?api_key=$apikey";

  static String movie_details_endpoint({required int id}) =>
      "$baseurl/movie/$id?api_key=$apikey";

  static String recommendation_endpoint({required int id}) =>
      "$baseurl/movie/$id/recommendations?api_key=$apikey";

  /* static String search_movie_endpoint({required String query}) =>
      "$baseurl/search/movie?api_key=$apikey&query=$query";*/
  static String search_movie_endpoint({required String query}) =>
      "$baseurl/search/movie?api_key=$apikey&query=${Uri.encodeQueryComponent(query)}";

  static const String baseimageurl = 'https://image.tmdb.org/t/p/original';

  static String imageUrl({required String path}) => '$baseimageurl$path';
}
