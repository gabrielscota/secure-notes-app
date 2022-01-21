import 'package:flutter/material.dart';

mixin KeyboardManager {
  void hideKeyboard(final BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
