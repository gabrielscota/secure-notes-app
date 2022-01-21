import 'package:get/get.dart';

import '../../../data/cache/cache.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxHomePresenter extends GetxController with NavigationManager implements HomePresenter {
  final FetchSecureCacheStorage fetchSecure;

  GetxHomePresenter({
    required this.fetchSecure,
  });

  @override
  void goToNotePage() {
    navigateToWithArgs = const NavigationArguments(route: Routes.note);
  }
}
