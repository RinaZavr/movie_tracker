import 'package:dio/dio.dart';
import 'package:movies_api/src/models/movie/movies_list_model.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  @GET('/account/{account_id}/rated/movies')
  Future<MoviesList> getRatedMovies(
    @Path('account_id') int accountId,
    @Query('page') int page,
    @Query('session_id') String sessionId,
    @Query('sort_by') String sortBy,
  );
}
