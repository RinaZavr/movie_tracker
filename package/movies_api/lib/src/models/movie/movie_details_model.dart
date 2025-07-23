import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetails {
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'budget')
  final int budget;

  @JsonKey(name: 'genres', fromJson: _paramsFromJson)
  final List<String> genres;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'imdb_id')
  final String? imdbId;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'production_companies', fromJson: _paramsFromJson)
  final List<String> productionCompanies;

  @JsonKey(name: 'production_countries', fromJson: _paramsFromJson)
  final List<String> productionCountries;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  @JsonKey(name: 'revenue')
  final int revenue;

  @JsonKey(name: 'runtime')
  final int runtime;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'vote_average', fromJson: _paramToRoundFromJson)
  final double voteAverage;

  const MovieDetails({
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.overview,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.title,
    required this.voteAverage,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);

  static List<String> _paramsFromJson(List<Map<String, dynamic>> json) =>
      json.map((e) => e['name'] as String).toList();

  static double _paramToRoundFromJson(double param) =>
      double.parse(param.toStringAsFixed(1));
}
