import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  @JsonKey(name: 'vote_average', fromJson: _paramToRoundFromJson)
  final double voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.posterPath,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  static double _paramToRoundFromJson(double param) =>
      double.parse(param.toStringAsFixed(1));
}
