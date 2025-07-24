import 'package:dio/dio.dart';
import 'package:movies_api/src/models/movie/movie_details_model.dart';
import 'package:movies_api/src/models/movie/movies_list_model.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_service.g.dart';

@RestApi()
abstract class MoviesService {
  factory MoviesService(Dio dio, {String baseUrl}) = _MoviesService;

  @GET('/movie/top_rated')
  Future<MoviesList> getTopRatedMovies({@Query('page') int page = 1});

  @GET('/movie/now_playing')
  Future<MoviesList> getNowPlayingMovies({@Query('page') int page = 1});

  @GET('/movie/popular')
  Future<MoviesList> getPopularMovies({@Query('page') int page = 1});

  @GET('/movie/upcoming')
  Future<MoviesList> getUpcomingMovies({@Query('page') int page = 1});

  @GET('/movie/{movie_id}')
  Future<MovieDetails> getMovieDetails({
    @Path('movie_id') required int movieId,
  });

  @GET('/movie/{movie_id}/videos')
  Future<MoviesList> getMovieVideos({@Path('movie_id') required int movieId});

  @GET('/movie/{movie_id}/reviews')
  Future<MoviesList> getMovieReviews({@Path('movie_id') required int movieId});

  @GET('/movie/{movie_id}/images')
  Future<MoviesList> getMovieImages({@Path('movie_id') required int movieId});

  @GET('/movie/{movie_id}/recommendations')
  Future<MoviesList> getMovieRecommendations({
    @Path('movie_id') required int movieId,
  });
}
