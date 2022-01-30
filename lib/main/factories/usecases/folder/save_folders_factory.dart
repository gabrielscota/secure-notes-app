import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../cache/cache.dart';

SaveFoldersUseCase makeLocalSaveFolders() => LocalSaveFolders(
      saveSecureCacheStorage: makeSecureStorageAdapter(),
    );
