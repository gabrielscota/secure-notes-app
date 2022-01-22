import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showEncryptedTextDialog(final String _encryptedText, final String _decryptedText) async {
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
}
