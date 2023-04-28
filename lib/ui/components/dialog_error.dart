import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showDialogError({required String message}) {
  if (Get.isDialogOpen ?? false) {
    Get.back();
  } else {
    Get.dialog(
      Dialog(
        child: Text(message),
      ),
    );
  }
}
