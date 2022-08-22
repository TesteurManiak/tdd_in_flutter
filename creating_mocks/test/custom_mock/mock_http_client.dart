import 'dart:convert';

import 'package:creating_mocks/my_http_client.dart';

import '../utils/fixture_reader.dart';

class MockHttpClient implements MyHttpClient {
  @override
  Future<T?> get<T>(String url) async {
    if (url == 'https://randomuser.me/api/') {
      return jsonDecode(fixture('random_user.json')) as T;
    }
    return null;
  }
}
