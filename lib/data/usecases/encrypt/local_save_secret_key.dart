import '../../../domain/usecases/usecases.dart' show SaveSecretKeyUseCase;
import '../../cache/cache.dart' show SaveSecureCacheStorage;

class LocalSaveSecretKey implements SaveSecretKeyUseCase {
  final SaveSecureCacheStorage saveSecure;

  LocalSaveSecretKey({
    required this.saveSecure,
  });

  @override
  Future<void> save({required final String secretKey}) async {
    await saveSecure.save(key: 'secretKey', value: secretKey);
  }
}
