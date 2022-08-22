import 'dart:convert';

import 'package:creating_mocks/my_http_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'utils/fixture_reader.dart';

void main() {
  group('DioClientImpl', () {
    const tUrl = 'https://randomuser.me/api/';

    group('get', () {
      test('fixture: random_user.json', () async {
        // arrange
        final json = jsonDecode(fixture('random_user.json'));
        final dio = Dio();
        final dioAdapter = DioAdapter(dio: dio);
        dioAdapter.onGet(tUrl, (server) => server.reply(200, json));
        final client = DioClientImpl(dio: dio);

        // act
        final result = await client.get<Map<String, dynamic>>(tUrl);

        // assert
        expect(result, json);
      });
    });
  });
}
