import 'package:album_demo/data/models/user/user_model.dart';
import 'package:album_demo/domain/entities/user/user.dart';

import 'base_data_mapper.dart';

class UserDataMapper extends BaseDataMapper<UserModel, User> {
  UserDataMapper();

  @override
  User mapToEntity(UserModel? data) {
    return User(
      id: data?.id ?? 0,
      username: '${data?.firstName} ${data?.lastName}',
      email: data?.email ?? '',
      avatarUrl: data?.avatarUrl ?? '',
    );
  }
}
