import 'package:creating_mocks/remote_datasource.dart';
import 'package:creating_mocks/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_http_client.dart';

void main() {
  group('RemoteDataSourceImpl', () {
    final mockClient = MockHttpClient();
    final dataSource = RemoteDataSourceImpl(httpClient: mockClient);

    group('getRandomUser', () {
      const tUser = UserModel(
        firstName: 'Hannah',
        lastName: 'Bélanger',
        email: 'hannah.belanger@example.com',
        phone: '114-933-7706',
        thumbnailUrl: 'https://randomuser.me/api/portraits/thumb/women/46.jpg',
      );

      test('should return a UserModel parsed from resources/random_user.json',
          () async {
        final user = await dataSource.getRandomUser();
        expect(user, tUser);
      });
    });
  });
}
