import 'package:album_demo/application/repositories/album_repository.dart';
import 'package:album_demo/application/usecases/album/load_data_usecase.dart';
import 'package:album_demo/domain/constants/error_message.dart';
import 'package:album_demo/domain/core/error.dart';
import 'package:album_demo/domain/core/result.dart';
import 'package:album_demo/domain/entities/user/user_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../mock_data/user_mock_data.dart';
import 'load_data_usecase_test.mocks.dart';

@GenerateMocks([AlbumRepository])
void main() {
  late MockAlbumRepository mockAlbumRepository;
  late LoadAlbumDataUseCase usecase;
  late UserData tUsers;
  late String page;
  late Error<UserData> error;

  setUp(() {
    mockAlbumRepository = MockAlbumRepository();
    usecase = LoadAlbumDataUseCase(mockAlbumRepository);
    page = "1";
    tUsers = mockUserData;
    error = Error<UserData>(
      ErrorType.poorNetwork,
      ErrorMessage.poorNetwork,
    );
  });

  test(
    'should get user data from the repository',
    () async {
      //arrange
      when(mockAlbumRepository.getData(page))
          .thenAnswer((_) async => Success(tUsers));

      //act
      final result = await usecase(ParamLoadData(page: page));

      //assert
      expect(result, equals(Success(tUsers)));

      // verify
      verify(mockAlbumRepository.getData(page));
      verifyNoMoreInteractions(mockAlbumRepository);
    },
  );

  test(
    'should throw error and message when poor network',
    () async {
      //arrange
      when(mockAlbumRepository.getData(page)).thenAnswer(
        (_) async => error,
      );

      //act
      final result = await usecase(ParamLoadData(page: page));

      //assert
      expect(result, equals(error));

      // verify
      verify(mockAlbumRepository.getData(page));
      verifyNoMoreInteractions(mockAlbumRepository);
    },
  );
}
