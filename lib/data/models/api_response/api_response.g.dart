// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiListResponse<T> _$$_ApiListResponseFromJson<T>(
        Map<String, dynamic> json) =>
    _$_ApiListResponse<T>(
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
      totalPage: json['total_pages'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map(_Converter<T>().fromJson)
          .toList(),
    );

Map<String, dynamic> _$$_ApiListResponseToJson<T>(
        _$_ApiListResponse<T> instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPage,
      'data': instance.data?.map(_Converter<T>().toJson).toList(),
    };
