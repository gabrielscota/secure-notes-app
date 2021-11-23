import '../../../data/encrypt/encrypt.dart';
import '../../../infra/encrypt/encrypt.dart';
import '../factories.dart';

EncryptData makeEncryptData() => Chacha20EncryptData(
      algorithm: makeEncryptAlgorithm(),
    );
