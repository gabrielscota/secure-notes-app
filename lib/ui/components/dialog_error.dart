import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showDialogError({required final String message}) {
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
