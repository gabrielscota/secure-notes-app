import '../../../data/encrypt/encrypt.dart';
import '../../../infra/encrypt/encrypt.dart';
import '../factories.dart';

EncryptGenerateKey makeEncryptGenerateKey() => Chacha20GenerateKey(
      algorithm: makeEncryptAlgorithm(),
    );
