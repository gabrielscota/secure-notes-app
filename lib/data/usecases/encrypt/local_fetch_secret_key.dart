import '../../../domain/usecases/usecases.dart' show FetchSecretKeyUseCase;
import '../../cache/cache.dart' show FetchSecureCacheStorage;

class LocalFetchSecretKey implements FetchSecretKeyUseCase {
  final FetchSecureCacheStorage fetchSecure;

  LocalFetchSecretKey({
    required this.fetchSecure,
  });

  @override
  Future<String> fetch() async {
    final String secretKey = await fetchSecure.fetch(key: 'secretKey');
    return secretKey;
  }
}
