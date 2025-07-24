part of 'movies_root_cubit.dart';

@immutable
sealed class MoviesRootState {}

final class MoviesRootInitial extends MoviesRootState {}

final class MoviesRootLoading extends MoviesRootState {}

final class MoviesRootLoaded extends MoviesRootState {
  MoviesRootLoaded({
    required this.topRated,
    required this.popular,
    required this.nowPlaying,
    required this.upcoming,
  });

  final List<Movie> topRated;
  final List<Movie> popular;
  final List<Movie> nowPlaying;
  final List<Movie> upcoming;
}

final class MoviesRootError extends MoviesRootState {
  MoviesRootError({required this.error});

  final String error;
}
