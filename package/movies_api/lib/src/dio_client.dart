import 'package:dio/dio.dart';
import 'package:movies_api/src/interceptor.dart';
import 'package:movies_api/src/services/movies/movies_service.dart';

class DioClient {
  DioClient({
    required String baseUrl,
    String? myApiKey,
    String currentLanguage = 'ru-RU',
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (status) {
          return status != null && status >= 200 && status < 300 ||
              status == 304;
        },
      ),
    )..interceptors.addAll([DioInterceptor(dioClient: this)]);

    apiKey = myApiKey;
    language = currentLanguage;
  }

  late Dio _dio;

  Dio get dio => _dio;

  MoviesService? _moviesService;

  String? apiKey;

  String language = 'ru-RU';

  MoviesService get moviesService {
    _moviesService ??= MoviesService(_dio);
    return _moviesService!;
  }
}
