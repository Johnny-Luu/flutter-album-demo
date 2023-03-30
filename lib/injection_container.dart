import 'package:album_demo/application/repositories/album_repository.dart';
import 'package:album_demo/application/usecases/album/load_data_usecase.dart';
import 'package:album_demo/data/api/api_client.dart';
import 'package:album_demo/data/datasources/album/album_remote_data_source.dart';
import 'package:album_demo/data/mapper/user_data_mapper.dart';
import 'package:album_demo/domain/core/network_info.dart';
import 'package:album_demo/presentation/features/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasources/album/album_local_data_source.dart';
import 'infrastructure/repositories/album_repository_impl.dart';
import 'presentation/features/theme_wrapper/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // Domain - Core
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => ApiClient());

  // Application - Use cases
  sl.registerLazySingleton(() => LoadAlbumDataUseCase(sl()));

  // Infrastructures - Repositories
  sl.registerLazySingleton<AlbumRepository>(() => AlbumRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
        mapper: sl(),
      ));

  // Data - Data mappers
  sl.registerLazySingleton(() => UserDataMapper());

  // Data - Data sources
  sl.registerLazySingleton<AlbumRemoteDataSource>(
      () => AlbumRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<AlbumLocalDataSource>(
      () => AlbumLocalDataSourceImpl(sharedPreferences: sl()));

  // Presentation
  sl.registerFactory(() => HomeBloc(loadAlbumDataUseCase: sl()));
  sl.registerFactory(() => ThemeCubit());
}
