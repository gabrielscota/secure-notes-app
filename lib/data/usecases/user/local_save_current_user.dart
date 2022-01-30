import '../../../domain/entities/entities.dart' show UserEntity;
import '../../../domain/helpers/helpers.dart' show DomainError, DomainErrorExtension;
import '../../../domain/usecases/user/save_current_user.dart';
import '../../cache/cache.dart' show SaveSecureCacheStorage;
import '../../models/models.dart';

class LocalSaveCurrentUser implements SaveCurrentUserUseCase {
  final SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentUser({
    required this.saveSecureCacheStorage,
  });

  @override
  Future<void> call({required final UserEntity user}) async {
    try {
      final String userJson = UserModel.fromDomain(entity: user).toJson();
      await saveSecureCacheStorage.save(key: 'currentUser', value: userJson);
    } on DomainError catch (error) {
      throw error.toDomainError();
    }
  }
}
