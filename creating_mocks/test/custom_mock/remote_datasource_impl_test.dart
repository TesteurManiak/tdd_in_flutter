import 'package:creating_mocks/remote_datasource.dart';
import 'package:creating_mocks/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks.dart';

void main() {
  group('RemoteDataSourceImpl', () {
    group('getRandomUser', () {
      test(
        'should return a UserModel parsed from resources/random_user.json',
        () async {
          // arrange
          const tUser = UserModel(
            firstName: 'Hannah',
            lastName: 'Bélanger',
            email: 'hannah.belanger@example.com',
            phone: '114-933-7706',
            thumbnailUrl:
                'https://randomuser.me/api/portraits/thumb/women/46.jpg',
          );
          final mockClient = MockHttpClient();
          final dataSource = RemoteDataSourceImpl(httpClient: mockClient);

          // act
          final user = await dataSource.getRandomUser();

          // assert
          expect(user, tUser);
        },
        tags: ['custom'],
      );

      test(
        'should return null when the request return null',
        () async {
          // arrange
          final mockClient = MockHttpClient2();
          final dataSource = RemoteDataSourceImpl(httpClient: mockClient);

          // act
          final user = await dataSource.getRandomUser();

          // assert
          expect(user, null);
        },
        tags: ['custom'],
      );
    });
  });
}
