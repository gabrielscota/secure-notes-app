import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

SplashPresenter makeGetxSplashPresenter() => GetxSplashPresenter(
      createSecretKeyUseCase: makeLocalCreateSecretKey(),
      fetchSecretKeyUseCase: makeLocalFetchSecretKey(),
      saveSecretKeyUseCase: makeLocalSaveSecretKey(),
      fetchCurrentUserUseCase: makeLocalFetchCurrentUser(),
    );
