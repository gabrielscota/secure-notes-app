import '../../../domain/usecases/usecases.dart' show CreateSecretKeyUseCase;
import '../../encrypt/encrypt.dart' show EncryptGenerateKey;

class LocalCreateSecretKey implements CreateSecretKeyUseCase {
  final EncryptGenerateKey encryptGenerateKey;

  LocalCreateSecretKey({
    required this.encryptGenerateKey,
  });

  @override
  Future<String> create() async {
    final String secretKey = await encryptGenerateKey.generate();
    return secretKey;
  }
}
