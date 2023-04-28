import 'package:get/get.dart';

import '../../../data/encrypt/encrypt.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxNotePresenter extends GetxController with UIErrorManager implements NotePresenter {
  // TODO: Remover usecase da camada de data e criar na camada de dominio
  final EncryptData encryptData;
  final DecryptData decryptData;
  final FetchSecretKeyUseCase fetchSecretKey;

  GetxNotePresenter({
    required this.encryptData,
    required this.decryptData,
    required this.fetchSecretKey,
  });

  @override
  Future<void> save({required String text}) async {
    try {
      final String secretKey = await fetchSecretKey.fetch();
      final String encryptedText = await encryptData.encrypt(text: text, secretKey: secretKey);
      final String decryptedText = await decryptData.decrypt(text: encryptedText, secretKey: secretKey);
    } on DomainError catch (error) {
      snackbarError = '${error.message} [${error.code.name}]';
    }
  }
}
