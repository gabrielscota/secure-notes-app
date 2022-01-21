import 'package:get/get.dart';

import '../../presentation/mixins/mixins.dart';

mixin NavigationManager {
  void handleNavigationWithArgs(
    final Stream<NavigationArguments> stream, {
    final bool clearStack = false,
  }) {
    stream.listen((final page) {
      if (page.route.isNotEmpty && page.route != '') {
        if (clearStack) {
          Get.offAllNamed(page.route, arguments: page.arguments);
        } else {
          Get.toNamed(page.route, arguments: page.arguments);
        }
      }
    });
  }
}
