import 'package:get/get.dart';

import '../../presentation/mixins/mixins.dart';

mixin NavigationManager {
  void handleNavigationWithArgs(Stream<NavigationArguments> stream, {bool clearStack = false}) {
    stream.listen((page) {
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
