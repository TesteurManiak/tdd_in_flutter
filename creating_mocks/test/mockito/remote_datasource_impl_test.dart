import 'dart:convert';

import 'package:creating_mocks/my_http_client.dart';
import 'package:creating_mocks/remote_datasource.dart';
import 'package:creating_mocks/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../utils/fixture_reader.dart';
import 'remote_datasource_impl_test.mocks.dart';

@GenerateMocks([MyHttpClient])
void main() {
  late MockMyHttpClient mockClient;
  late RemoteDataSourceImpl dataSource;

  setUp(() {
    mockClient = MockMyHttpClient();
    dataSource = RemoteDataSourceImpl(httpClient: mockClient);
  });

  group('Mockito: RemoteDataSourceImpl', () {
    group('getRandomUser', () {
      const tUrl = 'https://randomuser.me/api/';

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
          when(mockClient.get<Map<String, dynamic>>(tUrl)).thenAnswer(
            (_) async =>
                jsonDecode(fixture('random_user.json')) as Map<String, dynamic>,
          );

          // act
          final user = await dataSource.getRandomUser();

          // assert
          verify(mockClient.get<Map<String, dynamic>>(tUrl));
          expect(user, tUser);
        },
        tags: ['mockito'],
      );

      test(
        'should return null when the request return null',
        () async {
          // arrange
          when(mockClient.get(tUrl)).thenAnswer((_) async => null);

          // act
          final user = await dataSource.getRandomUser();

          // assert
          verify(mockClient.get(tUrl));
          expect(user, null);
        },
        tags: ['mockito'],
      );
    });
  });
}
