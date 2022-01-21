import 'package:get/get.dart';

import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxSplashPresenter extends GetxController with NavigationManager, UIErrorManager implements SplashPresenter {
  final CreateSecretKeyUseCase createSecretKey;
  final FetchSecretKeyUseCase fetchSecretKey;
  final SaveSecretKeyUseCase saveSecretKey;

  GetxSplashPresenter({
    required this.createSecretKey,
    required this.fetchSecretKey,
    required this.saveSecretKey,
  });

  @override
  Future<void> loadCurrentUser() async {
    try {
      final String _secretKey = await fetchSecretKey.fetch();
      if (_secretKey.isEmpty) {
        final String _newSecretKey = await createSecretKey.create();
        await saveSecretKey.save(secretKey: _newSecretKey);
      }
      // TODO(Gabriel): Buscar o usuário salvo local e verificar o token
      await Future.delayed(const Duration(seconds: 1));
      navigateToWithArgs = const NavigationArguments(route: Routes.home);
    } on DomainError catch (error) {
      snackbarError = '${error.message} [${error.code.name}]';
    }
  }
}
