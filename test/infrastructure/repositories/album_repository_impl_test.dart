import 'package:album_demo/data/datasources/album/album_local_data_source.dart';
import 'package:album_demo/data/datasources/album/album_remote_data_source.dart';
import 'package:album_demo/data/mapper/user_data_mapper.dart';
import 'package:album_demo/domain/constants/error_message.dart';
import 'package:album_demo/domain/core/error.dart';
import 'package:album_demo/domain/core/exception.dart';
import 'package:album_demo/domain/core/network_info.dart';
import 'package:album_demo/domain/core/result.dart';
import 'package:album_demo/domain/entities/user/user_data.dart';
import 'package:album_demo/infrastructure/repositories/album_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock_data/user_mock_data.dart';
import 'album_repository_impl_test.mocks.dart';

@GenerateMocks([NetworkInfo])
@GenerateMocks([UserDataMapper])
@GenerateMocks([AlbumRemoteDataSource])
@GenerateMocks([AlbumLocalDataSource])
void main() {
  late AlbumRepositoryImpl repository;
  late MockAlbumRemoteDataSource mockRemoteDataSource;
  late MockAlbumLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late UserDataMapper mockMapper;

  setUp(() {
    mockRemoteDataSource = MockAlbumRemoteDataSource();
    mockLocalDataSource = MockAlbumLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockMapper = MockUserDataMapper();
    repository = AlbumRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
      mapper: mockMapper,
    );

    when(mockMapper.mapToListEntity(any))
        .thenAnswer((realInvocation) => mockUsers);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  group('get users data', () {
    const String page = "1";
    final tApiResponse = apiListResponse;
    final tUserData = mockUserData;

    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getData(page))
          .thenAnswer((_) async => tApiResponse);

      //act
      await repository.getData(page);

      //assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        //arrange
        when(mockRemoteDataSource.getData(any))
            .thenAnswer((_) async => tApiResponse);

        //act
        final result = await repository.getData(page);

        //assert
        expect(result, equals(Success(tUserData)));
        verify(mockRemoteDataSource.getData(page));
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        //arrange
        when(mockRemoteDataSource.getData(any))
            .thenAnswer((_) async => tApiResponse);

        //act
        await repository.getData(page);

        //assert
        verify(mockRemoteDataSource.getData(page));
        verify(mockLocalDataSource.saveUserData(tApiResponse.data));
      });

      test(
          'should return NetworkException when the call to remote data source is successful',
          () async {
        //arrange
        when(mockRemoteDataSource.getData(any)).thenThrow(NetworkException());

        //act
        final result = await repository.getData(page);

        //assert
        verify(mockRemoteDataSource.getData(page));
        verifyZeroInteractions(mockLocalDataSource);
        expect(
          result,
          equals(
            Error<UserData>(
              ErrorType.poorNetwork,
              ErrorMessage.poorNetwork,
            ),
          ),
        );
      });
    });

    runTestsOffline(() {
      test('should return cached user data', () async {
        //arrange
        when(mockLocalDataSource.getUserData())
            .thenAnswer((_) async => mockUserModels);

        //act
        final result = await repository.getData(page);

        //assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getUserData());
        expect(result, equals(Success(tUserData)));
      });
    });
  });
}
