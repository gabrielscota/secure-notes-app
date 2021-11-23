import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/components.dart';
import '../helpers/errors/errors.dart';

mixin UIErrorManager {
  void handleMainError(BuildContext context, Stream<UIError?> stream,
      {SnackPosition snackPosition = SnackPosition.BOTTOM}) {
    stream.listen((error) {
      if (error != null && error != UIError.noError) {
        showErrorMessage(context, error.description, snackPosition);
      }
    });
  }
}
