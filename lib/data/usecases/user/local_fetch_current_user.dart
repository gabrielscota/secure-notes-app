import '../../../domain/entities/entities.dart' show UserEntity;
import '../../../domain/helpers/helpers.dart' show DomainError, DomainErrorExtension;
import '../../../domain/usecases/usecases.dart' show FetchCurrentUserUseCase;
import '../../cache/cache.dart' show FetchSecureCacheStorage;
import '../../models/models.dart' show UserModel;

class LocalFetchCurrentUser implements FetchCurrentUserUseCase {
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  LocalFetchCurrentUser({
    required this.fetchSecureCacheStorage,
  });

  @override
  Future<UserEntity> call() async {
    try {
      final String userJson = await fetchSecureCacheStorage.fetch(key: 'currentUser');
      return UserModel.fromJson(json: userJson);
    } on DomainError catch (error) {
      throw error.toDomainError();
    }
  }
}
