import 'package:get/get.dart';

mixin FormManager on GetxController {
  final RxBool _isFormValid = false.obs;
  Stream<bool> get isFormValidStream => _isFormValid.stream;
  bool get isFormValid => _isFormValid.value;
  set isFormValid(bool value) => _isFormValid.value = value;
}
