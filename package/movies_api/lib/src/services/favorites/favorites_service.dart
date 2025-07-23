import 'package:dio/dio.dart';
import 'package:movies_api/src/models/movie/movies_list_model.dart';
import 'package:retrofit/retrofit.dart';

part 'favorites_service.g.dart';

@RestApi()
abstract class FavoritesService {
  factory FavoritesService(Dio dio, {String baseUrl}) = _FavoritesService;

  @GET('/account/{account_id}/favorite/movies')
  Future<MoviesList> getFavoriteMovies(
    @Path('account_id') int accountId,
    @Query('page') int page,
    @Query('session_id') String sessionId,
    @Query('sort_by') String sortBy,
  );

  @GET('/account/{account_id}/watchlist/movies')
  Future<MoviesList> getWatchlistMovies(
    @Path('account_id') int accountId,
    @Query('page') int page,
    @Query('session_id') String sessionId,
    @Query('sort_by') String sortBy,
  );
}
