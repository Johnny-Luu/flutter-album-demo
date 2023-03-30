import 'package:album_demo/application/repositories/album_repository.dart';
import 'package:album_demo/application/usecases/album/load_data_usecase.dart';
import 'package:album_demo/domain/constants/error_message.dart';
import 'package:album_demo/domain/core/error.dart';
import 'package:album_demo/domain/core/result.dart';
import 'package:album_demo/domain/entities/user/user_data.dart';
import 'package:album_demo/presentation/features/home/bloc/home_bloc.dart';
import 'package:album_demo/presentation/features/home/bloc/home_event.dart';
import 'package:album_demo/presentation/features/home/bloc/home_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock_data/user_mock_data.dart';

class MockAlbumRepository extends Mock implements AlbumRepository {}

void main() {
  late MockAlbumRepository repository;
  late HomeBloc bloc;
  late String page;
  late Error<UserData> error;

  group("Home bloc test", () {
    setUp(() {
      repository = MockAlbumRepository();
      bloc = HomeBloc(loadAlbumDataUseCase: LoadAlbumDataUseCase(repository));
      page = "1";
      error = Error<UserData>(
        ErrorType.poorNetwork,
        ErrorMessage.poorNetwork,
      );
    });

    test('initial state is HomeInitialState', () {
      expect(bloc.state, HomeInitialState());
    });

    group("Get users data succeed when first initialized", () {
      blocTest<HomeBloc, HomeState>(
        'emit [HomeState] with correct states data when repositoty return employee list',
        build: () {
          when(repository.getData(page))
              .thenAnswer((_) async => Success(mockUserData));

          return bloc;
        },
        act: (bloc) => bloc.add(HomeInitialEvent()),
        expect: () => [
          HomeState(
            listData: mockUserData.data,
            totalPage: mockUserData.totalPage,
            currentPage: bloc.state.currentPage,
            isList: bloc.state.isList,
          )
        ],
      );
    });

    group("Change view mode", () {
      const isList = true;

      blocTest<HomeBloc, HomeState>(
        'emit [HomeState] with correct states data when change view mode',
        build: () {
          return bloc;
        },
        act: (bloc) => bloc.add(ChangeViewEvent(isList)),
        expect: () => [const HomeState(isList: isList)],
      );
    });

    group("Get users data succeed", () {
      blocTest<HomeBloc, HomeState>(
        'emit [HomeState] with correct states data when repositoty return employee list',
        build: () {
          when(repository.getData(page))
              .thenAnswer((_) async => Success(mockUserData));

          return bloc;
        },
        act: (bloc) => bloc.add(LoadAlbumListEvent(page)),
        expect: () => [
          HomeState(
            listData: mockUserData.data,
            totalPage: mockUserData.totalPage,
            currentPage: bloc.state.currentPage,
            isList: bloc.state.isList,
          )
        ],
      );
    });

    group("Get users data failed", () {
      blocTest<HomeBloc, HomeState>(
        'emit [HomeState] with error state when repositoty get data failed',
        build: () {
          when(repository.getData(page)).thenAnswer((_) async => error);

          return bloc;
        },
        act: (bloc) => bloc.add(LoadAlbumListEvent(page)),
        expect: () => [HomeErrorState(error.message)],
      );
    });

    group("Refresh list data", () {
      blocTest<HomeBloc, HomeState>(
        'emit [HomeState] with correct states data when refresh list data',
        build: () {
          return bloc;
        },
        act: (bloc) => bloc.add(RefreshAlbumListEvent()),
        expect: () => [
          HomeState(
            currentPage: 0,
            totalPage: 1,
            listData: [],
            isList: bloc.state.isList,
          ),
        ],
      );
    });
  });
}
