import 'package:json_annotation/json_annotation.dart';
import 'package:movies_api/src/models/profile/user_model.dart';

part 'movie_reviews_model.g.dart';

@JsonSerializable()
class MovieReviewsResponse {
  @JsonKey(name: 'results')
  final List<MovieReview> results;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  MovieReviewsResponse({required this.results, required this.totalPages});

  factory MovieReviewsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieReviewsResponseFromJson(json);
}

@JsonSerializable()
class MovieReview {
  @JsonKey(name: 'author')
  final String author;

  @JsonKey(name: 'author_details')
  final User user;

  @JsonKey(name: 'content')
  final String content;

  @JsonKey(name: 'created_at')
  final String createdAt;

  const MovieReview({
    required this.author,
    required this.user,
    required this.content,
    required this.createdAt,
  });

  factory MovieReview.fromJson(Map<String, dynamic> json) =>
      _$MovieReviewFromJson(json);

  Map<String, dynamic> toJson() => _$MovieReviewToJson(this);
}
