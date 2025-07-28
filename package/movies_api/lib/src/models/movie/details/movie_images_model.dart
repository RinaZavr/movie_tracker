import 'package:json_annotation/json_annotation.dart';

part 'movie_images_model.g.dart';

@JsonSerializable()
class MovieImages {
  @JsonKey(name: 'backdrops', fromJson: _paramsFromJson)
  final List<String> backdrops;

  @JsonKey(name: 'logos', fromJson: _paramsFromJson)
  final List<String> logos;

  @JsonKey(name: 'posters', fromJson: _paramsFromJson)
  final List<String> posters;

  const MovieImages({
    required this.backdrops,
    required this.logos,
    required this.posters,
  });

  factory MovieImages.fromJson(Map<String, dynamic> json) =>
      _$MovieImagesFromJson(json);

  Map<String, dynamic> toJson() => _$MovieImagesToJson(this);

  static List<String> _paramsFromJson(List<dynamic> json) => json
      .map((e) => (e as Map<String, dynamic>)['file_path'] as String)
      .toList();
}
