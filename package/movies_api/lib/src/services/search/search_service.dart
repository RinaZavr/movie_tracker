import 'package:dio/dio.dart';
import 'package:movies_api/src/models/movie/movies_list_model.dart';
import 'package:retrofit/retrofit.dart';

part 'search_service.g.dart';

@RestApi()
abstract class SearchService {
  factory SearchService(Dio dio, {String baseUrl}) = _SearchService;

  @GET('/search/movie')
  Future<MoviesList> getTopRatedMovies(
    @Query('query') String query,
    @Query('page') int page,
    @Query('primary_release_year') String primaryReleaseYear,
    @Query('region') String region,
  );
}
