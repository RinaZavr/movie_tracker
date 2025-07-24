part of 'movies_list_cubit.dart';

class MoviesListState {
  MoviesListState({
    this.movies = const [],
    this.error = '',
    this.isLoading = false,
  });

  final List<Movie> movies;
  final String error;
  final bool isLoading;

  MoviesListState copyWith({
    List<Movie>? movies,
    String? error,
    bool? isLoading,
  }) => MoviesListState(
    movies: movies ?? this.movies,
    error: error ?? this.error,
    isLoading: isLoading ?? this.isLoading,
  );
}
