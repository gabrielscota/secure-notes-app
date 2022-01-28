import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../cache/cache.dart';

FetchFoldersUseCase makeLocalFetchFolders() => LocalFetchFolders(
      fetchSecureCacheStorage: makeSecureStorageAdapter(),
    );
