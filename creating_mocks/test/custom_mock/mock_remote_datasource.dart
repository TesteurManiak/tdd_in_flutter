import 'dart:convert';

import 'package:creating_mocks/remote_datasource.dart';
import 'package:creating_mocks/user_model.dart';

import '../utils/fixture_reader.dart';

class MockRemoteDataSource implements RemoteDataSource {
  @override
  Future<UserModel?> getRandomUser() async {
    final jsonData =
        jsonDecode(fixture('random_user.json')) as Map<String, dynamic>;
    final results =
        (jsonData['results'] as Iterable).cast<Map<String, dynamic>>();
    return UserModel.fromJson(results.first);
  }
}
