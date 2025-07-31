import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_api/api_client.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit({required this.id}) : super(MovieDetailsInitial());

  final int id;
  final service = GetIt.I.get<DioClient>().moviesService;

  Future<void> getMovie({required Locale currentLocale}) async {
    try {
      emit(MovieDetailsLoading());
      final movie = await service.getMovieDetails(movieId: id);
      final trailers = await service.getMovieVideos(movieId: id, language: '');
      final reviews = await service.getMovieReviews(movieId: id);
      final images = await service.getMovieImages(movieId: id, language: '');
      final recommendations = await service.getMovieRecommendations(
        movieId: id,
      );

      emit(
        MovieDetailsLoaded(
          movieDetails: movie,
          trailer:
              trailers.results
                  .where(
                    (element) => element.language == currentLocale.languageCode,
                  )
                  .firstOrNull ??
              trailers.results.firstOrNull,
          review: reviews.results.firstOrNull,
          images: images,
          recommendations: recommendations.results,
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'MovieDetailsCubit');
      emit(MovieDetailsError(error: 'Не удалось загрузить фильм'));
    }
  }
}
