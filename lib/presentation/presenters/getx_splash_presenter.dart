import 'package:get/get.dart';

import '../../data/cache/cache.dart';
import '../../data/encrypt/encrypt.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxSplashPresenter extends GetxController with NavigationManager implements SplashPresenter {
  final FetchSecure fetchSecure;
  final SaveSecure saveSecure;
  final EncryptGenerateKey encryptGenerateKey;

  GetxSplashPresenter({
    required this.fetchSecure,
    required this.saveSecure,
    required this.encryptGenerateKey,
  });

  @override
  Future<void> loadCurrentUser() async {
    try {
      final String _secretKey = await fetchSecure.fetch(key: 'secretKey');
      if (_secretKey.isEmpty) {
        final String _newSecretKey = await encryptGenerateKey.generateKey();
        await saveSecure.save(key: 'secretKey', value: _newSecretKey);
      }
      final String userJson = await fetchSecure.fetch(key: 'currentUser');
      if (userJson.isNotEmpty) {
        // TODO: Criar o usuário através da string
      } else {}
      await Future.delayed(const Duration(seconds: 1));
      navigateToWithArgs = const NavigationArguments(route: Routes.home);
    } catch (_) {}
  }
}
