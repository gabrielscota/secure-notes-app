import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

FetchSecretKeyUseCase makeLocalFetchSecretKey() => LocalFetchSecretKey(
      fetchSecure: makeSecureStorageAdapter(),
    );
