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
