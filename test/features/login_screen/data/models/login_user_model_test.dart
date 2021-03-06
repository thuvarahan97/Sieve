import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tLoginUserModel = LoginUserModel(
      id: '1',
      email: 'Test123@gmail.com',
      password: 'Test@123',
      imageUrl: null,
      uid: null);
  final tLoginUserGFModel = LoginUserModel(
      id: '1',
      email: 'Test123@gmail.com',
      imageUrl: 'www.google.com',
      uid: '1',
      password: null);

  test(
    'should be a subclass of Numbertriva entity',
    () async {
      //assert
      expect(tLoginUserModel, isA<LoginUser>());
    },
  );

  group('fromJson', () {
    test(
      'should return LoginUserModel when input a valid json object',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixtureReader('login_user_fixture.json'));
        //act
        final result = LoginUserModel.fromJson(jsonMap);
        //assert
        expect(result, tLoginUserModel);
      },
    );
  });

  group('fromJsonGF', () {
    test(
      'should return LoginUserModel when input a valid json object',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixtureReader('login_user_gf_fixture.json'));
        //act
        final result = LoginUserModel.fromJsonGF(jsonMap);
        //assert
        expect(result, tLoginUserGFModel);
      },
    );
  });

  group('toJson()', () {
    test(
      'should return a JSON map containinf the proper data',
      () async {
        //act
        final result = tLoginUserModel.toJson();
        //assert
        final expectedMap = {
          'id': '1',
          'email': 'Test123@gmail.com',
          'password': 'Test@123',
          'uid':null,
          'imageUrl':null
        };
        expect(result, expectedMap);
      },
    );
  });
}
