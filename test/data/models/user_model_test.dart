import 'dart:convert';
import 'package:album_demo/data/models/user/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mock_data/user_mock_data.dart';

void main() {
  final UserModel tUserModel = mockUserModels[0];

  group('from json', () {
    test(
      'should return a valid model when the JSON is in happy case',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('users/user.json'));

        // act
        final result = UserModel.fromJson(jsonMap);

        // assert
        expect(result, tUserModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tUserModel.toJson();

        // assert
        final expectedMap = mockMapUserModel;

        // assert
        expect(result, expectedMap);
      },
    );
  });
}
