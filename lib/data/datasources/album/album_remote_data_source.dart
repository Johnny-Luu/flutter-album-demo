import 'package:album_demo/data/api/api_client.dart';
import 'package:album_demo/data/models/api_response/api_response.dart';
import 'package:album_demo/data/models/user/user_model.dart';
import 'package:album_demo/domain/core/exception.dart';
import 'package:flutter/material.dart';

abstract class AlbumRemoteDataSource {
  Future<ApiListResponse<UserModel>> getData(String page);
}

class AlbumRemoteDataSourceImpl implements AlbumRemoteDataSource {
  final ApiClient client;

  AlbumRemoteDataSourceImpl(this.client);

  @override
  Future<ApiListResponse<UserModel>> getData(String page) async {
    try {
      var result = await client.getData(page);
      return result;
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw NetworkException();
    }
  }
}
