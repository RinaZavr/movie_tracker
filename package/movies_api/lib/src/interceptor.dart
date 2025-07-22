import 'package:dio/dio.dart';
import 'package:movies_api/api_client.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor({required DioClient dioClient}) : _dioClient = dioClient;

  final DioClient _dioClient;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    options.headers['Authorization'] = 'Bearer ${_dioClient.apiKey}';
    if (!options.queryParameters.keys.contains('language') &&
        options.path.contains('movie')) {
      options.queryParameters['language'] = _dioClient.language;
    }
    return handler.next(options);
  }
}
