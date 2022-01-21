import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/encrypt/encrypt.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
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

      await Get.dialog(
        Dialog(
          backgroundColor: Theme.of(Get.context!).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Encrypted Text',
                      textAlign: TextAlign.left,
                      style: Theme.of(Get.context!).textTheme.headline6?.copyWith(
                            color: Theme.of(Get.context!).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            _encryptedText,
                            textAlign: TextAlign.left,
                            style: Theme.of(Get.context!).textTheme.subtitle1?.copyWith(
                                  color: Theme.of(Get.context!).colorScheme.primary,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Decrypted Text',
                      textAlign: TextAlign.left,
                      style: Theme.of(Get.context!).textTheme.headline6?.copyWith(
                            color: Theme.of(Get.context!).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            _decryptedText,
                            textAlign: TextAlign.left,
                            style: Theme.of(Get.context!).textTheme.subtitle1?.copyWith(
                                  color: Theme.of(Get.context!).colorScheme.primary,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } on DomainError catch (error) {
      snackbarError = '${error.message} [${error.code.name}]';
    }
  }
}
