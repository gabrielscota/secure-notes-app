import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../cache/cache.dart';

FetchCurrentUserUseCase makeLocalFetchCurrentUser() => LocalFetchCurrentUser(
      fetchSecureCacheStorage: makeSecureStorageAdapter(),
    );
