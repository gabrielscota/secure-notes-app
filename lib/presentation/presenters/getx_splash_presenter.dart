import 'package:get/get.dart';

import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxSplashPresenter extends GetxController with NavigationManager implements SplashPresenter {
  final CreateSecretKey createSecretKey;
  final FetchSecretKey fetchSecretKey;
  final SaveSecretKey saveSecretKey;

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
      // TODO: Buscar o usuário salvo local e verificar o token
      await Future.delayed(const Duration(seconds: 1));
      navigateToWithArgs = const NavigationArguments(route: Routes.home);
    } catch (_) {}
  }
}
