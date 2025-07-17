import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/src/config/router/routes_consts.dart';
import 'package:movie_tracker/src/features/favourites/list/view/favourites_screen.dart';
import 'package:movie_tracker/src/features/main/view/main_wrapper.dart';
import 'package:movie_tracker/src/features/movies/list/view/movies_list_screen.dart';
import 'package:movie_tracker/src/features/movies/root/view/movies_screen.dart';
import 'package:movie_tracker/src/features/profile/list/view/profile_screen.dart';
import 'package:movie_tracker/src/features/search/main/view/search_screen.dart';

part 'routes.g.dart';

@TypedShellRoute<MainWrapperRoute>(
  routes: [
    TypedGoRoute<MoviesRoute>(path: AppRoutesConsts.movies),
    TypedGoRoute<SearchRoute>(path: AppRoutesConsts.search),
    TypedGoRoute<FavouritesRoute>(path: AppRoutesConsts.favourites),
    TypedGoRoute<ProfileRoute>(path: AppRoutesConsts.profile),
  ],
)
class MainWrapperRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainWrapper(child: navigator);
  }
}

@TypedGoRoute<MoviesRoute>(path: AppRoutesConsts.movies)
class MoviesRoute extends GoRouteData with _$MoviesRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const MoviesScreen(),
      transitionsBuilder: (_, __, ___, child) => child,
    );
  }
}

@TypedGoRoute<SearchRoute>(path: AppRoutesConsts.search)
class SearchRoute extends GoRouteData with _$SearchRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const SearchScreen(),
      transitionsBuilder: (_, __, ___, child) => child,
    );
  }
}

@TypedGoRoute<FavouritesRoute>(path: AppRoutesConsts.favourites)
class FavouritesRoute extends GoRouteData with _$FavouritesRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const FavouritesScreen(),
      transitionsBuilder: (_, __, ___, child) => child,
    );
  }
}

@TypedGoRoute<ProfileRoute>(path: AppRoutesConsts.profile)
class ProfileRoute extends GoRouteData with _$ProfileRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const ProfileScreen(),
      transitionsBuilder: (_, __, ___, child) => child,
    );
  }
}

@TypedGoRoute<MoviesListRoute>(path: AppRoutesConsts.moviesList)
class MoviesListRoute extends GoRouteData with _$MoviesListRoute {
  MoviesListRoute({required this.title, required this.images});

  final String title;
  final List<String> images;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MoviesListScreen(title: title, images: images);
  }
}
