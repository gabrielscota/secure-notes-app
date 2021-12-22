import '../../../domain/usecases/usecases.dart';
import '../../encrypt/encrypt.dart';

class LocalCreateSecretKey implements CreateSecretKey {
  final EncryptGenerateKey encryptGenerateKey;

  LocalCreateSecretKey({
    required this.encryptGenerateKey,
  });

  @override
  Future<String> create() async {
    final String _secretKey = await encryptGenerateKey.generate();
    return _secretKey;
  }
}
