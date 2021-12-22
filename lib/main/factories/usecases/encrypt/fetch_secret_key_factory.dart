import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

FetchSecretKey makeLocalFetchSecretKey() => LocalFetchSecretKey(
      fetchSecure: makeSecureStorageAdapter(),
    );
