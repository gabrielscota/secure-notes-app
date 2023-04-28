import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

mixin ConnectivityManager {
  Future<void> handleConnectivityWarning() async {
    bool hasShowConnectionError = false;

    final ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none && !hasShowConnectionError) {
      hasShowConnectionError = true;
      Get.closeAllSnackbars();
      Get.showSnackbar(connectivityWarningSnackbar());
    }

    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none && !hasShowConnectionError) {
        hasShowConnectionError = true;
        Get.closeAllSnackbars();
        Get.showSnackbar(connectivityWarningSnackbar());
      } else if ((event == ConnectivityResult.wifi || event == ConnectivityResult.mobile) && hasShowConnectionError) {
        hasShowConnectionError = false;
        Get.closeAllSnackbars();
        Get.showSnackbar(
          GetSnackBar(
            backgroundColor: Colors.green.shade400,
            duration: const Duration(seconds: 3),
            snackPosition: SnackPosition.TOP,
            messageText: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Iconsax.warning_24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Conexão reestabelecida! A sincronização está ativada novamente.',
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
    });
  }

  GetSnackBar connectivityWarningSnackbar() => GetSnackBar(
        backgroundColor: Theme.of(Get.context!).colorScheme.error,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        messageText: Row(
          children: [
            const Icon(Iconsax.warning_24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Parece que você está sem conexão, a sincronização está desativada.',
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                      color: Theme.of(Get.context!).colorScheme.onError,
                    ),
              ),
            ),
          ],
        ),
      );
}
