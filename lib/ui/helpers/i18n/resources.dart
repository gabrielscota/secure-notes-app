import 'package:flutter/widgets.dart';

import './translations/translations.dart';

mixin R {
  static Translation string = EnUs();

  static void load(final Locale locale) {
    switch (locale.toString()) {
      case 'pt_BR':
        string = PtBr();
        break;
      default:
        string = EnUs();
        break;
    }
  }
}
