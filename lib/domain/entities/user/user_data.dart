import 'package:album_demo/domain/entities/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    @Default(0) int totalPage,
    @Default([]) List<User> data,
  }) = _UserData;
}
