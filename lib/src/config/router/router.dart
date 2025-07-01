import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/src/config/router/routes.dart';

abstract class AppRouter {
  const AppRouter._();

  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: $appRoutes,
    initialLocation: MovieListRoute().location,
  );
}
