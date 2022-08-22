import 'package:creating_mocks/random_user_repository.dart';
import 'package:creating_mocks/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks.dart';

void main() {
  group('Custom Mock: RandomUserRepository', () {
    group('fetchRandomUser', () {
      test(
        'should return a UserModel parsed from resources/random_user.json',
        () async {
          // arrange
          final mockRemoteDataSource = MockRemoteDataSource();
          final repository = RandomUserRepositoryImpl(
            remoteDataSource: mockRemoteDataSource,
          );

          // act
          final randomUser = await repository.fetchRandomUser();

          // assert
          expect(
            randomUser,
            const UserModel(
              firstName: 'Hannah',
              lastName: 'Bélanger',
              email: 'hannah.belanger@example.com',
              phone: '114-933-7706',
              thumbnailUrl:
                  'https://randomuser.me/api/portraits/thumb/women/46.jpg',
            ),
          );
        },
        tags: ['custom'],
      );
    });
  });
}
