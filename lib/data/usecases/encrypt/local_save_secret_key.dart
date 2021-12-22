import '../../../domain/usecases/usecases.dart';
import '../../cache/cache.dart';

class LocalSaveSecretKey implements SaveSecretKey {
  final SaveSecure saveSecure;

  LocalSaveSecretKey({
    required this.saveSecure,
  });

  @override
  Future<void> save({required String secretKey}) async {
    await saveSecure.save(key: 'secretKey', value: secretKey);
  }
}
