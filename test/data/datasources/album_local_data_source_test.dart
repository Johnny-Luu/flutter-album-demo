import 'dart:convert';

import 'package:album_demo/data/datasources/album/album_local_data_source.dart';
import 'package:album_demo/data/models/user/user_model.dart';
import 'package:album_demo/domain/constants/cache_key.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mock_data/user_mock_data.dart';
import 'album_local_data_source_test.mocks.dart';

@GenerateMocks(
  [SharedPreferences],
  customMocks: [
    MockSpec<SharedPreferences>(as: #MockSharedPreferencesForTest),
  ],
)
void main() {
  late AlbumLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        AlbumLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('get last users', () {
    List<dynamic> parsedUsersJson = json.decode(fixture('users/users.json'));
    final tAllUsersModel =
        List<UserModel>.from(parsedUsersJson.map((i) => UserModel.fromJson(i)));

    test(
        'should return all users from SharedPreferences when there is one in the cache',
        () async {
      //arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('users/users.json'));

      //act
      final result = await dataSource.getUserData();

      //assert
      verify(mockSharedPreferences.getString(CacheKey.cacheAllUsers));
      expect(result, equals(tAllUsersModel));
    });
  });

  group('cache all users', () {
    final tAllUsersModel = mockUserModels;

    test('should call SharedPreferences to cache the data', () async {
      //arrange
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => true);

      //act
      dataSource.saveUserData(tAllUsersModel);

      //assert
      final expectedJsonString =
          json.encode(tAllUsersModel.map((u) => u.toJson()).toList());

      verify(mockSharedPreferences.setString(
        CacheKey.cacheAllUsers,
        expectedJsonString,
      ));
    });
  });
}
