import 'dart:convert';

import 'package:creating_mocks/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/fixture_reader.dart';

void main() {
  group('UserModel', () {
    const tUser = UserModel(
      firstName: 'Hannah',
      lastName: 'Bélanger',
      email: 'hannah.belanger@example.com',
      phone: '114-933-7706',
      thumbnailUrl: 'https://randomuser.me/api/portraits/thumb/women/46.jpg',
    );

    group('fromJson', () {
      test('fixture: random_user.json', () {
        final json =
            jsonDecode(fixture('random_user.json')) as Map<String, dynamic>;
        final results =
            (json['results'] as Iterable).cast<Map<String, dynamic>>();

        final user = UserModel.fromJson(results.first);
        expect(user, tUser);
      });
    });

    group('operator ==', () {
      test('two user with the same properties are equal', () {
        const user = UserModel(
          firstName: 'Hannah',
          lastName: 'Bélanger',
          email: 'hannah.belanger@example.com',
          phone: '114-933-7706',
          thumbnailUrl:
              'https://randomuser.me/api/portraits/thumb/women/46.jpg',
        );

        expect(user, tUser);
      });
    });

    group('hashCode', () {
      test('two user with the same properties have the same hashCode', () {
        const user = UserModel(
          firstName: 'Hannah',
          lastName: 'Bélanger',
          email: 'hannah.belanger@example.com',
          phone: '114-933-7706',
          thumbnailUrl:
              'https://randomuser.me/api/portraits/thumb/women/46.jpg',
        );

        expect(user.hashCode, tUser.hashCode);
      });
    });
  });
}
