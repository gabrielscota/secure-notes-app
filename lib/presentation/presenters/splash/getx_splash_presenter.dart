import 'package:get/get.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxSplashPresenter extends GetxController with NavigationManager, UIErrorManager implements SplashPresenter {
  final CreateSecretKeyUseCase createSecretKeyUseCase;
  final FetchSecretKeyUseCase fetchSecretKeyUseCase;
  final SaveSecretKeyUseCase saveSecretKeyUseCase;
  final FetchCurrentUserUseCase fetchCurrentUserUseCase;

  GetxSplashPresenter({
    required this.createSecretKeyUseCase,
    required this.fetchSecretKeyUseCase,
    required this.saveSecretKeyUseCase,
    required this.fetchCurrentUserUseCase,
  });

  @override
  Future<void> loadCurrentUser() async {
    try {
      // TODO: Verificar a etapa de criação da secret key
      final String _secretKey = await fetchSecretKeyUseCase.fetch();
      if (_secretKey.isEmpty) {
        final String _newSecretKey = await createSecretKeyUseCase.create();
        await saveSecretKeyUseCase.save(secretKey: _newSecretKey);
      }
      await Future.delayed(const Duration(seconds: 1));
      final UserEntity currentUser = await fetchCurrentUserUseCase.call();
      if (currentUser.id.isNotEmpty) {
        navigateToWithArgs = const NavigationArguments(route: Routes.home);
      } else {
        navigateToWithArgs = const NavigationArguments(route: Routes.onboarding);
      }
    } on DomainError catch (error) {
      snackbarError = '${error.message} [${error.code.name}]';
    }
  }
}
