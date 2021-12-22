import 'package:get/get.dart';

import '../../data/encrypt/encrypt.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/components/components.dart';
import '../../ui/pages/pages.dart';

class GetxNotePresenter extends GetxController implements NotePresenter {
  // TODO: Remover usecase da camada de infra e criar na camada de dominio
  final EncryptData encryptData;
  final DecryptData decryptData;
  final FetchSecretKey fetchSecretKey;

  GetxNotePresenter({
    required this.encryptData,
    required this.decryptData,
    required this.fetchSecretKey,
  });

  @override
  Future<void> save({required String text}) async {
    try {
      final String _secretKey = await fetchSecretKey.fetch();
      final String _encryptedText = await encryptData.encrypt(text: text, secretKey: _secretKey);
      final String _decryptedText = await decryptData.decrypt(text: _encryptedText, secretKey: _secretKey);
      showErrorMessage(
        Get.context!,
        'Encrypted Text: $_encryptedText\n\nDecrypted Text: $_decryptedText',
        SnackPosition.TOP,
      );
    } catch (_) {}
  }
}
