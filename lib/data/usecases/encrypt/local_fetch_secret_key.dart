import '../../../domain/usecases/usecases.dart';
import '../../cache/cache.dart';

class LocalFetchSecretKey implements FetchSecretKey {
  final FetchSecure fetchSecure;

  LocalFetchSecretKey({
    required this.fetchSecure,
  });

  @override
  Future<String> fetch() async {
    final String _secretKey = await fetchSecure.fetch(key: 'secretKey');
    return _secretKey;
  }
}
