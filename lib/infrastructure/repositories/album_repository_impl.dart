import 'package:album_demo/application/repositories/album_repository.dart';
import 'package:album_demo/data/datasources/album/album_local_data_source.dart';
import 'package:album_demo/data/datasources/album/album_remote_data_source.dart';
import 'package:album_demo/data/mapper/user_data_mapper.dart';
import 'package:album_demo/domain/constants/error_message.dart';
import 'package:album_demo/domain/core/error.dart';
import 'package:album_demo/domain/core/exception.dart';
import 'package:album_demo/domain/core/network_info.dart';
import 'package:album_demo/domain/core/result.dart';
import 'package:album_demo/domain/entities/user/user_data.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumRemoteDataSource remoteDataSource;
  final AlbumLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final UserDataMapper mapper;

  AlbumRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.mapper,
  });

  @override
  Future<Result<UserData>> getData(String page) async {
    // simulate delayed time when call api
    // await Future.delayed(const Duration(milliseconds: 1500));
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getData(page);
        final resultList = result.data ?? [];

        if (resultList.isNotEmpty) {
          await localDataSource.saveUserData(resultList);
        }

        final userData = UserData(
          totalPage: result.totalPage ?? 0,
          data: mapper.mapToListEntity(resultList),
        );

        return Success(userData);
      } on NetworkException {
        return Error<UserData>(ErrorType.poorNetwork, ErrorMessage.poorNetwork);
      }
    } else {
      final cachedUsers = await localDataSource.getUserData();
      final userData = UserData(
        totalPage: 1,
        data: mapper.mapToListEntity(cachedUsers),
      );
      return Success(userData);
    }
  }
}
