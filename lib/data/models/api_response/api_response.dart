import 'package:album_demo/data/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class ApiListResponse<T> with _$ApiListResponse<T> {
  factory ApiListResponse({
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'total_pages') int? totalPage,
    @_Converter() @JsonKey(name: "data") List<T>? data,
  }) = _ApiListResponse;

  factory ApiListResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiListResponseFromJson<T>(json);
}

class _Converter<T> implements JsonConverter<T, dynamic> {
  const _Converter();

  @override
  T fromJson(dynamic json) {
    switch (T.toString()) {
      case "UserModel":
        final item = json as Map<String, dynamic>;
        return UserModel.fromJson(item) as T;
      default:
        throw UnsupportedError('Unsupported type: $T');
    }
  }

  @override
  dynamic toJson(T object) => object;
}
