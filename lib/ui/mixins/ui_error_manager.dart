import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/components.dart';
import '../helpers/errors/errors.dart';

mixin UIErrorManager {
  void handleMainError(
    final BuildContext context,
    final Stream<UIError?> stream, {
    final SnackPosition snackPosition = SnackPosition.BOTTOM,
  }) {
    stream.listen((final error) {
      if (error != null && error != UIError.noError) {
        showErrorMessage(context, error.description, snackPosition);
      }
    });
  }
}
