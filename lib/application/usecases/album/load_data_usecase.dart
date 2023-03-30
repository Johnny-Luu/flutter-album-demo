import 'package:album_demo/application/repositories/album_repository.dart';
import 'package:album_demo/domain/core/result.dart';
import 'package:album_demo/domain/core/usecase.dart';
import 'package:album_demo/domain/entities/user/user_data.dart';
import 'package:equatable/equatable.dart';

class LoadAlbumDataUseCase implements UseCase<UserData, ParamLoadData> {
  final AlbumRepository repository;

  LoadAlbumDataUseCase(this.repository);

  @override
  Future<Result<UserData>?> call(ParamLoadData params) async {
    return await repository.getData(params.page);
  }
}

class ParamLoadData extends Equatable {
  final String page;

  const ParamLoadData({required this.page});

  @override
  List<Object> get props => [page];
}
