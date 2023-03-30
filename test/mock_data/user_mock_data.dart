import 'package:album_demo/data/models/api_response/api_response.dart';
import 'package:album_demo/data/models/user/user_model.dart';
import 'package:album_demo/domain/entities/user/user.dart';
import 'package:album_demo/domain/entities/user/user_data.dart';

UserData mockUserData = UserData(
  totalPage: 1,
  data: mockUsers,
);

List<User> mockUsers = const [
  User(
    id: 1,
    email: "george.bluth@reqres.in",
    username: "George Bluth",
    avatarUrl: "https://reqres.in/img/faces/1-image.jpg",
  ),
  User(
    id: 2,
    email: "janet.weaver@reqres.in",
    username: "Janet Weaver",
    avatarUrl: "https://reqres.in/img/faces/2-image.jpg",
  ),
];

List<UserModel> mockUserModels = [
  UserModel(
    1,
    "george.bluth@reqres.in",
    "George",
    "Bluth",
    "https://reqres.in/img/faces/1-image.jpg",
  ),
  UserModel(
    2,
    "janet.weaver@reqres.in",
    "Janet",
    "Weaver",
    "https://reqres.in/img/faces/2-image.jpg",
  ),
];

Map<String, dynamic> mockMapUserModel = {
  'id': 1,
  'email': "george.bluth@reqres.in",
  'first_name': "George",
  'last_name': "Bluth",
  'avatar': "https://reqres.in/img/faces/1-image.jpg",
};

ApiListResponse<UserModel> apiListResponse = ApiListResponse(
  data: mockUserModels,
  page: 1,
  totalPage: 1,
  perPage: 6,
  total: 6,
);
