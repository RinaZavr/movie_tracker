import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_api/api_client.dart';

part 'movies_list_state.dart';

class MoviesRootCubit extends Cubit<MoviesRootState> {
  MoviesRootCubit() : super(MoviesRootInitial());

  final service = GetIt.instance<DioClient>().moviesService;

  Future<void> getMovies() async {
    emit(MoviesRootLoading());
    
    try {
      final topRatedMovies = await service.getTopRatedMovies();
      final popularMovies = await service.getPopularMovies();
      final nowPlayingMovies = await service.getNowPlayingMovies();
      final upcomingMovies = await service.getUpcomingMovies();

      emit(
        MoviesListLoaded(
          topRated: topRatedMovies.results,
          popular: popularMovies.results,
          nowPlaying: nowPlayingMovies.results,
          upcoming: upcomingMovies.results,
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'MoviesListCubit');
      emit(MoviesListError(error: 'Не удалось загрузить фильмы'));
    }
  }
}
