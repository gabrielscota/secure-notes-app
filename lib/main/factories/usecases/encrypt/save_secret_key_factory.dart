import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

SaveSecretKey makeLocalSaveSecretKey() => LocalSaveSecretKey(
      saveSecure: makeSecureStorageAdapter(),
    );
