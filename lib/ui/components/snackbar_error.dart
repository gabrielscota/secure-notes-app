import 'package:get/get.dart';

void showSnackbarError({required final String message}) {
  if (Get.isSnackbarOpen) {
    Get.closeAllSnackbars();
  } else {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
      ),
    );
  }
}
