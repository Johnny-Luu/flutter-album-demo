// Mocks generated by Mockito 5.4.0 from annotations
// in album_demo/test/infrastructure/repositories/album_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:album_demo/data/datasources/album/album_local_data_source.dart'
    as _i9;
import 'package:album_demo/data/datasources/album/album_remote_data_source.dart'
    as _i8;
import 'package:album_demo/data/mapper/user_data_mapper.dart' as _i6;
import 'package:album_demo/data/models/api_response/api_response.dart' as _i3;
import 'package:album_demo/data/models/user/user_model.dart' as _i7;
import 'package:album_demo/domain/core/network_info.dart' as _i4;
import 'package:album_demo/domain/entities/user/user.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUser_0 extends _i1.SmartFake implements _i2.User {
  _FakeUser_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeApiListResponse_1<T> extends _i1.SmartFake
    implements _i3.ApiListResponse<T> {
  _FakeApiListResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i4.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [UserDataMapper].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserDataMapper extends _i1.Mock implements _i6.UserDataMapper {
  MockUserDataMapper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.User mapToEntity(_i7.UserModel? data) => (super.noSuchMethod(
        Invocation.method(
          #mapToEntity,
          [data],
        ),
        returnValue: _FakeUser_0(
          this,
          Invocation.method(
            #mapToEntity,
            [data],
          ),
        ),
      ) as _i2.User);
  @override
  List<_i2.User> mapToListEntity(List<_i7.UserModel>? listData) =>
      (super.noSuchMethod(
        Invocation.method(
          #mapToListEntity,
          [listData],
        ),
        returnValue: <_i2.User>[],
      ) as List<_i2.User>);
}

/// A class which mocks [AlbumRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAlbumRemoteDataSource extends _i1.Mock
    implements _i8.AlbumRemoteDataSource {
  MockAlbumRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.ApiListResponse<_i7.UserModel>> getData(String? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #getData,
          [page],
        ),
        returnValue: _i5.Future<_i3.ApiListResponse<_i7.UserModel>>.value(
            _FakeApiListResponse_1<_i7.UserModel>(
          this,
          Invocation.method(
            #getData,
            [page],
          ),
        )),
      ) as _i5.Future<_i3.ApiListResponse<_i7.UserModel>>);
}

/// A class which mocks [AlbumLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAlbumLocalDataSource extends _i1.Mock
    implements _i9.AlbumLocalDataSource {
  MockAlbumLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void>? saveUserData(List<_i7.UserModel>? userList) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveUserData,
          [userList],
        ),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>?);
}
