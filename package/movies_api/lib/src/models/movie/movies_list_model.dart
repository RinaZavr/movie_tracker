import 'package:json_annotation/json_annotation.dart';
import 'package:movies_api/src/models/movie/movie_model.dart';

part 'movies_list_model.g.dart';

@JsonSerializable()
class MoviesList {
  @JsonKey(name: 'page')
  final int page;

  @JsonKey(name: 'total_results')
  final int totalResults;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  @JsonKey(name: 'results')
  final List<Movie> results;

  MoviesList({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.results,
  });

  factory MoviesList.fromJson(Map<String, dynamic> json) =>
      _$MoviesListFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesListToJson(this);
}
