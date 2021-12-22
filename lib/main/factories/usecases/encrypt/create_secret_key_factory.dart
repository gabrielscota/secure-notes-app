import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

CreateSecretKey makeLocalCreateSecretKey() => LocalCreateSecretKey(
      encryptGenerateKey: makeEncryptGenerateKey(),
    );
