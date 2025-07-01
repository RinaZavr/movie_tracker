import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/src/config/router/routes_consts.dart';
import 'package:movie_tracker/src/features/movies/list/view/movies_list_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<MovieListRoute>(
  path: AppRoutesConsts.moviesList,
)
class MovieListRoute extends GoRouteData with _$MovieListRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MoviesListScreen();
  }
}
