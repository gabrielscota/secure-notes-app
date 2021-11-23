import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

void showErrorMessage(BuildContext context, String error, SnackPosition snackPosition) {
  if (snackPosition == SnackPosition.TOP) {
    Get.showSnackbar(
      GetBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
        margin: const EdgeInsets.all(24.0),
        borderRadius: 12.0,
        messageText: Row(
          children: [
            Icon(
              IconlyLight.danger,
              color: Theme.of(context).colorScheme.onError,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                error,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Theme.of(context).colorScheme.onError,
                    ),
              ),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 1900),
        animationDuration: const Duration(milliseconds: 1200),
        isDismissible: false,
        snackPosition: snackPosition,
      ),
    );
  } else {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.error,
      ),
    );
    Get.showSnackbar(
      GetBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        messageText: Text(
          error,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Theme.of(context).colorScheme.onError,
              ),
        ),
        duration: const Duration(milliseconds: 1900),
        animationDuration: const Duration(milliseconds: 1200),
        isDismissible: false,
        snackPosition: snackPosition,
      ),
    );
    Future.delayed(const Duration(milliseconds: 2900), () {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: Theme.of(context).colorScheme.background,
        ),
      );
    });
  }
}
