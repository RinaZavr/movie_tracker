import 'package:dio/dio.dart';
import 'package:movies_api/src/models/movie/movies_list_model.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_service.g.dart';

@RestApi()
abstract class MoviesService {
  factory MoviesService(Dio dio, {String baseUrl}) = _MoviesService;
}
