import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_tracker/src/features/movies/utils/utils.dart';
import 'package:movies_api/api_client.dart';

part 'movies_list_state.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  MoviesListCubit({required this.category}) : super(MoviesListState()) {
    final service = GetIt.I.get<DioClient>().moviesService;
    switch (category) {
      case MovieCategory.topRated:
        currentRequest = service.getTopRatedMovies;
        break;
      case MovieCategory.popular:
        currentRequest = service.getPopularMovies;
        break;
      case MovieCategory.nowPlaying:
        currentRequest = service.getNowPlayingMovies;
        break;
      case MovieCategory.upcoming:
        currentRequest = service.getUpcomingMovies;
        break;
    }
  }

  final MovieCategory category;
  late Future<MoviesList> Function({int page}) currentRequest;

  int _currentPage = 1;
  bool hasMore = true;

  Future<void> getMovies({int? page}) async {
    try {
      if (page != null) {
        _currentPage = page;
      }

      if (_currentPage == 1) {
        emit(state.copyWith(isLoading: true));
      }

      if (hasMore || _currentPage == 1) {
        final movies = await currentRequest(page: _currentPage);

        final nextPage = movies.results;

        if (nextPage.isNotEmpty) {
          final currentItems = state.movies;
          final newItems = <Movie>[...currentItems, ...nextPage];
          hasMore = _currentPage < movies.totalPages;

          emit(state.copyWith(movies: newItems, error: '', isLoading: false));

          _currentPage++;
        } else {
          emit(state.copyWith(error: '', isLoading: false));
        }
      }
    } catch (e) {
      log(e.toString(), name: 'MoviesListCubit');
      emit(
        state.copyWith(
          error: 'Не удалось загрузить фильмы',
          isLoading: false,
          movies: [],
        ),
      );
    }
  }
}
