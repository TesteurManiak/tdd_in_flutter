import 'dart:convert';

import 'package:creating_mocks/my_http_client.dart';
import 'package:creating_mocks/remote_datasource.dart';
import 'package:creating_mocks/user_model.dart';

import '../utils/fixture_reader.dart';

/// Mock implementation of [MyHttpClient] to return the content of a fixture
/// file.
class MockHttpClient implements MyHttpClient {
  @override
  Future<T?> get<T>(String url) async {
    if (url == 'https://randomuser.me/api/') {
      return jsonDecode(fixture('random_user.json')) as T;
    }
    return null;
  }
}

/// Mock implementation of [MyHttpClient] to return null.
class MockHttpClient2 implements MyHttpClient {
  @override
  Future<T?> get<T>(String url) async => null;
}

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
