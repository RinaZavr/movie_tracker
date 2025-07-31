import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'avatar_path')
  final String? avatar;

  @JsonKey(name: 'avatar')
  final AvatarData? avatarData;

  const User({
    required this.name,
    required this.username,
    this.avatar,
    this.avatarData,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json['name'],
    username: json['username'],
    avatar: json['avatar_path'],
    avatarData: json['avatar'] != null
        ? AvatarData.fromJson(json['avatar'])
        : null,
  );

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String? getAvatar() {
    if (avatar != null) {
      return 'https://secure.gravatar.com/avatar/$avatar';
    }
    if (avatarData != null) {
      if (avatarData!.tmdb != null) {
        return 'https://image.tmdb.org/t/p/original/${avatarData!.tmdb}';
      }
      if (avatarData!.gravatar != null) {
        return 'https://www.gravatar.com/avatar/${avatarData!.gravatar}';
      }
    }
    return null;
  }
}

class AvatarData {
  final String? tmdb;
  final String? gravatar;

  const AvatarData({required this.tmdb, required this.gravatar});

  factory AvatarData.fromJson(Map<String, Map<String, dynamic>> json) =>
      AvatarData(
        tmdb: json['gravatar']?['hash'],
        gravatar: json['tmdb']?['avatar_path'],
      );

  Map<String, dynamic> toJson() => {};
}
