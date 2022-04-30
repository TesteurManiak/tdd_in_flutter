import 'my_http_client.dart';
import 'user_model.dart';

abstract class RemoteDataSource {
  Future<UserModel?> getRandomUser();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final MyHttpClient _httpClient;

  RemoteDataSourceImpl({required MyHttpClient httpClient})
      : _httpClient = httpClient;

  @override
  Future<UserModel?> getRandomUser() async {
    final data = await _httpClient
        .get<Map<String, dynamic>>('https://randomuser.me/api/');
    if (data != null) {
      return UserModel.fromJson(data['results'][0] as Map<String, dynamic>);
    }
    return null;
  }
}
