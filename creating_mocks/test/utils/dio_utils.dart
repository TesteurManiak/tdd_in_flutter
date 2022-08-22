import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

enum RequestType { get, post }

@immutable
class ReplyData<T> {
  final int code;
  final RequestType type;
  final T data;
  final Map<String, List<String>> headers;
  final String? statusMessage;

  const ReplyData({
    required this.code,
    required this.type,
    required this.data,
    this.headers = const {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
    this.statusMessage,
  });
}

Dio setupDio<T>({
  required String url,
  required List<ReplyData> data,
}) {
  assert(data.isNotEmpty);

  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  for (final reply in data) {
    switch (reply.type) {
      case RequestType.get:
        dioAdapter.onGet(url, (server) {
          server.reply(
            reply.code,
            reply.data,
            headers: reply.headers,
          );
        });
        break;
      case RequestType.post:
        dioAdapter.onPost(url, (server) {
          server.reply(
            reply.code,
            reply.data,
            headers: reply.headers,
          );
        });
        break;
    }
  }
  return dio;
}
