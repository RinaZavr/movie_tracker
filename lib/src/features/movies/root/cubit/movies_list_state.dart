part of 'movies_list_cubit.dart';

@immutable
sealed class MoviesRootState {}

final class MoviesRootInitial extends MoviesRootState {}

final class MoviesRootLoading extends MoviesRootState {}

final class MoviesListLoaded extends MoviesRootState {
  MoviesListLoaded({
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

final class MoviesListError extends MoviesRootState {
  MoviesListError({required this.error});

  final String error;
}
