import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../cache/cache.dart';

SaveCurrentUserUseCase makeLocalSaveCurrentUser() => LocalSaveCurrentUser(
      saveSecureCacheStorage: makeSecureStorageAdapter(),
    );
