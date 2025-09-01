import 'package:cleanarch/movies/domain/entities/Recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.poster_path,
    required super.id,
  });

  factory RecommendationModel.fromjson(json) {
    return RecommendationModel(
        poster_path: json['poster_path'], id: json['id']);
  }
}
