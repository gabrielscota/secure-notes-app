import 'package:get/get.dart';

import '../../../data/encrypt/encrypt.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/components/components.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxNotePresenter extends GetxController with UIErrorManager implements NotePresenter {
  // TODO(Gabriel): Remover usecase da camada de data e criar na camada de dominio
  final EncryptData encryptData;
  final DecryptData decryptData;
  final FetchSecretKeyUseCase fetchSecretKey;

  GetxNotePresenter({
    required this.encryptData,
    required this.decryptData,
    required this.fetchSecretKey,
  });

  @override
  Future<void> save({required final String text}) async {
    try {
      final String _secretKey = await fetchSecretKey.fetch();
      final String _encryptedText = await encryptData.encrypt(text: text, secretKey: _secretKey);
      final String _decryptedText = await decryptData.decrypt(text: _encryptedText, secretKey: _secretKey);
      showErrorMessage(
        Get.context!,
        'Encrypted Text: $_encryptedText\n\nDecrypted Text: $_decryptedText',
        SnackPosition.TOP,
      );
    } on DomainError catch (error) {
      snackbarError = '${error.message} [${error.code.name}]';
    }
  }
}
