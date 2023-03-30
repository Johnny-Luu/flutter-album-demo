import 'package:album_demo/data/api/api_endpoint.dart';
import 'package:album_demo/data/models/api_response/api_response.dart';
import 'package:album_demo/data/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:album_demo/config/api_config.dart';
import 'package:retrofit/retrofit.dart';

import 'logging_interceptor.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient() {
    return _ApiClient(restClient, baseUrl: ApiConfig.baseURL);
  }

  static Dio restClient = Dio()
    ..options = BaseOptions(
      receiveTimeout: ApiConfig.timeOut,
      connectTimeout: ApiConfig.timeOut,
    )
    ..interceptors.addAll([LoggingInterceptor()]);

  @GET(ApiEndpoint.getData)
  Future<ApiListResponse<UserModel>> getData(@Query("page") String page);
}
