import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

SplashPresenter makeGetxSplashPresenter() => GetxSplashPresenter(
      fetchSecure: makeSecureStorageAdapter(),
      saveSecure: makeSecureStorageAdapter(),
      encryptGenerateKey: makeEncryptGenerateKey(),
    );
