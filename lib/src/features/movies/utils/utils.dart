import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';

enum MovieCategory {
  topRated,
  popular,
  nowPlaying,
  upcoming;

  String toJson() => name;

  static MovieCategory fromJson(String json) =>
      MovieCategory.values.firstWhere((e) => e.name == json);

  String localized(BuildContext context) {
    switch (this) {
      case MovieCategory.topRated:
        return '';
      case MovieCategory.popular:
        return context.l10n.popularMovies;
      case MovieCategory.nowPlaying:
        return context.l10n.nowPlayingMovies;
      case MovieCategory.upcoming:
        return context.l10n.upcomingMovies;
    }
  }
}

String capitalize(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}

String formatDuration(int totalMinutes) {
  final hours = totalMinutes ~/ 60;
  final minutes = totalMinutes % 60;

  final hoursPart = hours > 0 ? '$hours ч.' : '';
  final minutesPart = minutes > 0 ? '$minutes мин.' : '';

  var time = '';

  if (hoursPart.isNotEmpty && minutesPart.isNotEmpty) {
    time = '$hoursPart $minutesPart';
  }
  return time;
}
