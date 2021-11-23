import 'package:get/get.dart';

import '../../data/encrypt/encrypt.dart';
import '../../ui/components/components.dart';
import '../../ui/pages/pages.dart';

class GetxNotePresenter extends GetxController implements NotePresenter {
  final EncryptData encryptData;
  final DecryptData decryptData;
  final EncryptGenerateKey encryptGenerateKey;

  GetxNotePresenter({
    required this.encryptData,
    required this.decryptData,
    required this.encryptGenerateKey,
  });

  @override
  Future<void> save({required String text}) async {
    try {
      // TODO: Implementar o load da chave local
      final String _secretKey = await encryptGenerateKey.generateKey();
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
