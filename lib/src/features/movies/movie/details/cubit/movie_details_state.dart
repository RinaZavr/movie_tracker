part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsLoaded extends MovieDetailsState {
  MovieDetailsLoaded({
    required this.movieDetails,
    required this.trailer,
    required this.review,
    required this.images,
    required this.recommendations,
  });

  final MovieDetails movieDetails;
  final MovieTrailer? trailer;
  final MovieReview? review;
  final MovieImages images;
  final MoviesList recommendations;
}

final class MovieDetailsError extends MovieDetailsState {
  MovieDetailsError({required this.error});

  final String error;
}
