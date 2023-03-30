import 'dart:convert';

import 'package:album_demo/data/models/user/user_model.dart';
import 'package:album_demo/domain/constants/cache_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AlbumLocalDataSource {
  Future<void>? saveUserData(List<UserModel> userList);
  Future<List<UserModel>>? getUserData();
}

class AlbumLocalDataSourceImpl implements AlbumLocalDataSource {
  final SharedPreferences sharedPreferences;

  AlbumLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void>? saveUserData(List<UserModel> userList) async {
    await sharedPreferences.setString(
      CacheKey.cacheAllUsers,
      json.encode(userList.map((u) => u.toJson()).toList()),
    );
  }

  @override
  Future<List<UserModel>>? getUserData() async {
    final jsonString = sharedPreferences.getString(CacheKey.cacheAllUsers);
    return jsonString != null
        ? json
            .decode(jsonString)
            .map<UserModel>((e) => UserModel.fromJson(e))
            .toList()
        : [];
  }
}
