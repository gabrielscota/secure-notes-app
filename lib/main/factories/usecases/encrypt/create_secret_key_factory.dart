import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

CreateSecretKeyUseCase makeLocalCreateSecretKey() => LocalCreateSecretKey(
      encryptGenerateKey: makeEncryptGenerateKey(),
    );
