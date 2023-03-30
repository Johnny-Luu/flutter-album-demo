// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiListResponse<T> _$ApiListResponseFromJson<T>(Map<String, dynamic> json) {
  return _ApiListResponse<T>.fromJson(json);
}

/// @nodoc
mixin _$ApiListResponse<T> {
  @JsonKey(name: 'page')
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int? get totalPage => throw _privateConstructorUsedError;
  @_Converter()
  @JsonKey(name: "data")
  List<T>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiListResponseCopyWith<T, ApiListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiListResponseCopyWith<T, $Res> {
  factory $ApiListResponseCopyWith(
          ApiListResponse<T> value, $Res Function(ApiListResponse<T>) then) =
      _$ApiListResponseCopyWithImpl<T, $Res, ApiListResponse<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: 'page') int? page,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'total_pages') int? totalPage,
      @_Converter() @JsonKey(name: "data") List<T>? data});
}

/// @nodoc
class _$ApiListResponseCopyWithImpl<T, $Res, $Val extends ApiListResponse<T>>
    implements $ApiListResponseCopyWith<T, $Res> {
  _$ApiListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPage = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiListResponseCopyWith<T, $Res>
    implements $ApiListResponseCopyWith<T, $Res> {
  factory _$$_ApiListResponseCopyWith(_$_ApiListResponse<T> value,
          $Res Function(_$_ApiListResponse<T>) then) =
      __$$_ApiListResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'page') int? page,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'total_pages') int? totalPage,
      @_Converter() @JsonKey(name: "data") List<T>? data});
}

/// @nodoc
class __$$_ApiListResponseCopyWithImpl<T, $Res>
    extends _$ApiListResponseCopyWithImpl<T, $Res, _$_ApiListResponse<T>>
    implements _$$_ApiListResponseCopyWith<T, $Res> {
  __$$_ApiListResponseCopyWithImpl(
      _$_ApiListResponse<T> _value, $Res Function(_$_ApiListResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPage = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ApiListResponse<T>(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiListResponse<T> implements _ApiListResponse<T> {
  _$_ApiListResponse(
      {@JsonKey(name: 'page') this.page,
      @JsonKey(name: 'per_page') this.perPage,
      @JsonKey(name: 'total') this.total,
      @JsonKey(name: 'total_pages') this.totalPage,
      @_Converter() @JsonKey(name: "data") final List<T>? data})
      : _data = data;

  factory _$_ApiListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ApiListResponseFromJson(json);

  @override
  @JsonKey(name: 'page')
  final int? page;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  @JsonKey(name: 'total')
  final int? total;
  @override
  @JsonKey(name: 'total_pages')
  final int? totalPage;
  final List<T>? _data;
  @override
  @_Converter()
  @JsonKey(name: "data")
  List<T>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ApiListResponse<$T>(page: $page, perPage: $perPage, total: $total, totalPage: $totalPage, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiListResponse<T> &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, perPage, total, totalPage,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiListResponseCopyWith<T, _$_ApiListResponse<T>> get copyWith =>
      __$$_ApiListResponseCopyWithImpl<T, _$_ApiListResponse<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiListResponseToJson<T>(
      this,
    );
  }
}

abstract class _ApiListResponse<T> implements ApiListResponse<T> {
  factory _ApiListResponse(
          {@JsonKey(name: 'page') final int? page,
          @JsonKey(name: 'per_page') final int? perPage,
          @JsonKey(name: 'total') final int? total,
          @JsonKey(name: 'total_pages') final int? totalPage,
          @_Converter() @JsonKey(name: "data") final List<T>? data}) =
      _$_ApiListResponse<T>;

  factory _ApiListResponse.fromJson(Map<String, dynamic> json) =
      _$_ApiListResponse<T>.fromJson;

  @override
  @JsonKey(name: 'page')
  int? get page;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(name: 'total')
  int? get total;
  @override
  @JsonKey(name: 'total_pages')
  int? get totalPage;
  @override
  @_Converter()
  @JsonKey(name: "data")
  List<T>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ApiListResponseCopyWith<T, _$_ApiListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
