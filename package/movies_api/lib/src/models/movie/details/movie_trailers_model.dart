import 'package:json_annotation/json_annotation.dart';

part 'movie_trailers_model.g.dart';

@JsonSerializable()
class MovieTrailersResponse {
  @JsonKey(name: 'results')
  final List<MovieTrailer> results;

  MovieTrailersResponse({required this.results});

  factory MovieTrailersResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieTrailersResponseFromJson(json);
}

@JsonSerializable()
class MovieTrailer {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'key')
  final String key;

  @JsonKey(name: 'site')
  final String site;

  @JsonKey(name: 'iso_639_1')
  final String language;

  const MovieTrailer({
    required this.name,
    required this.key,
    required this.site,
    required this.language,
  });

  factory MovieTrailer.fromJson(Map<String, dynamic> json) =>
      _$MovieTrailerFromJson(json);

  Map<String, dynamic> toJson() => _$MovieTrailerToJson(this);
}
