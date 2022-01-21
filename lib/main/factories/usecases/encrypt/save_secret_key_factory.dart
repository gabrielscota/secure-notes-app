import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

SaveSecretKeyUseCase makeLocalSaveSecretKey() => LocalSaveSecretKey(
      saveSecure: makeSecureStorageAdapter(),
    );
