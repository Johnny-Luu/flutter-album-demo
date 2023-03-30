import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint(
        "--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}");
    debugPrint("Headers:");
    options = await requestInterceptor(options);
    options.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("queryParameters:");
    options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    if (options.data != null) {
      debugPrint("Body: ${options.data}");
    }
    debugPrint("--> END ${options.method.toUpperCase()}");

    return super.onRequest(options, handler);
  }

  Future<RequestOptions> requestInterceptor(RequestOptions options) async {
    // String token = await userPref.getTokenData();
    // options.headers.addAll({'Authorization': 'Bearer $token'});
    return options;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    debugPrint("Response: ${response.data}");
    debugPrint("<-- END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
        "<-- ${err.message} ${(err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}");
    debugPrint(
        "${err.response != null ? err.response?.data : 'Unknown Error'}");
    debugPrint("<-- End error");
    return super.onError(err, handler);
  }
}
