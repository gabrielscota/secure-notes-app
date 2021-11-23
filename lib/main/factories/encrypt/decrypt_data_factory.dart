import '../../../data/encrypt/encrypt.dart';
import '../../../infra/encrypt/encrypt.dart';
import '../factories.dart';

DecryptData makeDecryptData() => Chacha20DecryptData(
      algorithm: makeEncryptAlgorithm(),
    );
