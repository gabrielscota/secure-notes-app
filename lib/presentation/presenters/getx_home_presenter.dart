import 'package:get/get.dart';

import '../../data/cache/cache.dart';
import '../../ui/pages/pages.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  final FetchSecure fetchSecure;

  GetxHomePresenter({
    required this.fetchSecure,
  });
}
