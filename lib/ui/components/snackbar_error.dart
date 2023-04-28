import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

void showSnackbarError({required String message}) {
  if (Get.isSnackbarOpen) {
    Get.closeAllSnackbars();
  } else {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: Theme.of(Get.context!).colorScheme.error,
        duration: const Duration(seconds: 3),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        messageText: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Iconsax.danger),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                      color: Theme.of(Get.context!).colorScheme.onError,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
