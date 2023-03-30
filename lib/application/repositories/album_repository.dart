import 'package:album_demo/domain/core/result.dart';
import 'package:album_demo/domain/entities/user/user_data.dart';

abstract class AlbumRepository {
  Future<Result<UserData>>? getData(String page);
}
