import 'remote_datasource.dart';
import 'user_model.dart';

abstract class RandomUserRepository {
  Future<UserModel?> fetchRandomUser();
}

class RandomUserRepositoryImpl implements RandomUserRepository {
  final RemoteDataSource _remoteDataSource;

  RandomUserRepositoryImpl({required RemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<UserModel?> fetchRandomUser() {
    return _remoteDataSource.getRandomUser();
  }
}
