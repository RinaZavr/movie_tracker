import 'package:dio/dio.dart';
import 'package:movies_api/api_client.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor({required DioClient dioClient}) : _dioClient = dioClient;

  final DioClient _dioClient;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    options.headers['Authorization'] = 'Bearer ${_dioClient.apiKey}';
    options.queryParameters['include_adult'] = 'false';

    if (!options.queryParameters.keys.contains('language') &&
        options.path.contains('movie')) {
      options.queryParameters['language'] = _dioClient.language;
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // if (response.statusCode == 200 && response.data != null) {
    //   if (response.data is List<Map<String, dynamic>>) {
    //     (response.data as List<Map<String, dynamic>>).removeWhere(
    //       (element) => element['adult'] == true,
    //     );
    //   } else if (response.data is Map<String, dynamic>) {
    //     (response.data as Map<String, dynamic>).removeWhere(
    //       (key, value) => key == 'adult' && value == true,
    //     );
    //   }
    // }
    if (response.statusCode == 200 && response.data != null) {
      final data = response.data;

      if (data is List) {
        data.removeWhere(
          (element) =>
              // element is Map<String, dynamic> && _isSuspicious(element),
              element is Map<String, dynamic> &&
              (element['adult'] == true || element['overview'] == ''),
        );
      } else if (data is Map<String, dynamic>) {
        if (data['results'] is List) {
          (data['results'] as List).removeWhere(
            (element) =>
                element is Map<String, dynamic> &&
                (element['adult'] == true || element['overview'] == ''),
            // element is Map<String, dynamic> && _isSuspicious(element),
          );
        }
        // В случае одиночного объекта
        else if (data['adult'] == true || data['overview'] == '') {
          response.data = null;
        }
      }
    }
    return handler.next(response);
  }

  // static bool _isSuspicious(Map<String, dynamic> movie) {
  //   String normalize(String input) {
  //     return input.toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '');
  //   }

  //   final suspiciousWords = <String>{
  //     'erotic',
  //     'porn',
  //     'hardcore',
  //     'softcore',
  //     'uncensored',
  //     'nsfw',
  //     'xxx',
  //     'эротика',
  //     'порно',
  //     'хардкор',
  //     'мягкое порно',
  //     'без цензуры',
  //     'эротический',
  //     'возбуждение',
  //     'интим',
  //     'сексуальный',
  //     'секс',
  //     'для взрослых',
  //     'жесткое порно',
  //     'домашнее видео',
  //   };

  //   String getStr(String key) => normalize(movie[key]?.toString() ?? '');

  //   final title = getStr('title');
  //   final originalTitle = getStr('original_title');
  //   final overview = getStr('overview');
  //   final keywords =
  //       (movie['keywords'] as List?)?.map((e) => normalize(e.toString())) ?? [];

  //   final combinedText =
  //       '$title $originalTitle $overview ${keywords.join(' ')}';
  //   final containsBadWord = suspiciousWords.any(combinedText.contains);

  //   return containsBadWord ||
  //       (movie['adult'] == true) ||
  //       (movie['original_language'] == 'ja');
  // }
}
